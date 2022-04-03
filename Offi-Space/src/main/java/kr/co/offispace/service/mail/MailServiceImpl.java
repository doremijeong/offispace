package kr.co.offispace.service.mail;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.MailCriteria;
import kr.co.offispace.command.MailPageMaker;
import kr.co.offispace.command.MessagePageMaker;
import kr.co.offispace.dao.mail.MailDAO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.MailVO;
import kr.co.offispace.dto.MessageVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;

public class MailServiceImpl implements MailService{

	private MailDAO mailDAO;

	public void setMailDAO(MailDAO mailDAO) {
		this.mailDAO = mailDAO;
	}

	private AttachmentService attachService;

	public void setAttachService(AttachmentService attachService) {
		this.attachService = attachService;
	}

	private EmployeeService employeeService;

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	private NotificationService notificationService;

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	@Override
	public String transferMail(MailVO mail) throws SQLException {
		String mailCode = mailDAO.insertMail(mail);

		mail.setMailCode(mailCode);

		if(mail.getMailToEmpCodeList() != null && !mail.getMailToEmpCodeList().isEmpty()) {
			for (String empCode : mail.getMailToEmpCodeList()) {
				mail.setMailCode(mailCode);
				mail.setMailTo(empCode);
				mailDAO.insertMailInfo(mail);
				if(!mail.getMailTo().equals(mail.getMailFrom())) {
					// 보낸 메일 알림 추가
					NotificationVO noti = new NotificationVO(mailCode, mail.getMailFrom(), "mail/detail?mailCode=" + mailCode + "&kindOfMail=recieved&from=main", empCode,
							"메일이 도착했습니다.", "far fa-envelope", "새로운 메일");
					if(mail.getMailImportance().equals("Y")) {
						noti.setNtImportant("Y");
					}
					notificationService.registerNotification(noti);
				}
			}
		}

		if(mail.getMailRefEmpCodeList() != null && !mail.getMailRefEmpCodeList().isEmpty()) {
			for (String empCode : mail.getMailRefEmpCodeList()) {
				mail.setMailCode(mailCode);
				mail.setMailRefEmpcode(empCode);
				mailDAO.insertMailRef(mail);
				// 참조 메일 알림 추가
				NotificationVO noti = new NotificationVO(mailCode, mail.getMailFrom(), "mail/detail?mailCode=" + mailCode + "&kindOfMail=recieved&from=main", empCode,
						"메일에 참조되었습니다.", "far fa-envelope", "참조된 메일");
				if(mail.getMailImportance().equals("Y")) {
					noti.setNtImportant("Y");
				}
				notificationService.registerNotification(noti);
			}
		}

		if(mail.getAttachList() != null) {
			for (AttachmentVO attach : mail.getAttachList()) {
				attach.setAttachGroup(mailCode);    // 첨부파일에 넣을 PK
				attach.setAttachRegister(mail.getMailFrom()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}


        String sort = null;

        if(mail.getMailTo() != null && mail.getMailTo().equals(mail.getMailFrom())) {
            sort = "FromMe";
        } else {
            sort = "normal";
        }

        return sort;

	}

	@Override
	public Map<String, Object> getSendMailList(MailCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MailVO> sendMailList = mailDAO.selectSendList(cri);

		int totalCount = mailDAO.selectSendListCount(cri);

		for (MailVO mail : sendMailList){

			MailVO mailTemp = mailDAO.selectMailbyMailCode(mail.getMailCode());
			mail.setMailTitle(mailTemp.getMailTitle());
			mail.setMailCont(mailTemp.getMailCont());
			mail.setMailDate(mailTemp.getMailDate());
			mail.setMailImportance(mailTemp.getMailImportance());

			List<MailVO> mailToList = mailDAO.selectMailToList(mail.getMailCode());
			List<EmployeeVO> mailToEmpList = new ArrayList<>();
			int cnt = 0;
			for (MailVO mailTo : mailToList) {
				EmployeeVO emp = employeeService.getEmployeeByEmpCode(mailTo.getMailTo());
				mailToEmpList.add(emp);
				cnt ++;
			}
			mail.setMailToEmpList(mailToEmpList);
			mail.setMailToCount(cnt);

			List<MailVO> mailInfo = mailDAO.selectMailInfoByMailCode(mail.getMailCode());
			
			// 메일을 여러명에게 보냈을 경우 
			mail.setMailStatus(mailInfo.get(0).getMailStatus());
		}

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("sendMailList", sendMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getRecievedMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MailVO> recievedMailList = mailDAO.selectRecievedMailList(cri);

		int totalCount = mailDAO.selectRecievedMailListCount(cri);

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(totalCount);

		int notReadMailCount = mailDAO.selectRecievedMailListNotReadCount(cri);

		for (MailVO mail : recievedMailList){

			List<MailVO> mailInfo = mailDAO.selectMailInfoByMailCode(mail.getMailCode());
			EmployeeVO fromEmp = employeeService.getEmployeeByEmpCode(mailInfo.get(0).getMailFrom());
			mail.setMailFromEmp(fromEmp);

			if(mailInfo != null) {
				for (MailVO mailVO : mailInfo) {
					if(mailVO.getMailTo().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailStatus());
					}
				}
			}

			List<MailVO> refList = mailDAO.selectMailRefbyMailCode(mail.getMailCode());
			if(refList != null) {
				for (MailVO mailVO : refList) {
					if(mailVO.getMailRefEmpcode().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailRefStatus());
					}
				}
			}
			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

		}

		dataMap.put("totalCount", totalCount);
		dataMap.put("notReadMailCount", notReadMailCount);
		dataMap.put("recievedMailList", recievedMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getSendToMeMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MailVO> toMeList = mailDAO.selectToMeList(cri);

		int totalCount = mailDAO.selectToMeListCount(cri);

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(totalCount);

		for(MailVO mail : toMeList) {
			EmployeeVO fromEmp = employeeService.getEmployeeByEmpCode(mail.getMailFrom());
			mail.setMailFromEmp(fromEmp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

			if(mail.getMailTo() != cri.getLoginUser()) {
				List<MailVO> mailRefList = mailDAO.selectMailRefbyMailCode(mail.getMailCode());
				for (MailVO mailVO : mailRefList) {
					if(mailVO.getMailRefEmpcode() == cri.getLoginUser()) {
						mail.setMailStatus(mailVO.getMailRefStatus());
					}
				}
			}
		}

		dataMap.put("toMeList", toMeList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getSendTempMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MailVO> sendTempMailList = mailDAO.selectSendTempList(cri);

		int totalCount = mailDAO.selectSendTempListCount(cri);

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(totalCount);

		for (MailVO mail : sendTempMailList) {
			MailVO mailTemp = mailDAO.selectMailbyMailCode(mail.getMailCode());
			mail.setMailTitle(mailTemp.getMailTitle());
			mail.setMailCont(mailTemp.getMailCont());
			mail.setMailDate(mailTemp.getMailDate());
			mail.setMailImportance(mailTemp.getMailImportance());

			List<MailVO> mailToList = mailDAO.selectMailToList(mail.getMailCode());
			List<EmployeeVO> mailToEmpList = new ArrayList<>();
			int cnt = 0;
			for (MailVO mailTo : mailToList) {
				EmployeeVO emp = employeeService.getEmployeeByEmpCode(mailTo.getMailTo());
				mailToEmpList.add(emp);
				cnt ++;
			}
			mail.setMailToEmpList(mailToEmpList);
			mail.setMailToCount(cnt);

			List<MailVO> mailInfo = mailDAO.selectMailInfoByMailCode(mail.getMailCode());

			if(mailInfo != null) {
				for (MailVO mailVO : mailInfo) {
					if(mailVO.getMailTo().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailStatus());
					}
				}
			}

			List<MailVO> refList = mailDAO.selectMailRefbyMailCode(mail.getMailCode());
			if(refList != null) {
				for (MailVO mailVO : refList) {
					if(mailVO.getMailRefEmpcode().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailRefStatus());
					}
				}
			}
		}


		dataMap.put("sendTempMailList", sendTempMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public Map<String, Object> getTrashMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<String> mailCodeList = mailDAO.selectTrashMailCode(cri);

		int totalCnt = mailDAO.selectTrashMailCodeCount(cri);

		List<MailVO> mailList = new ArrayList<>();

		for (String mailCode : mailCodeList) {
			MailVO mail = mailDAO.selectMailbyMailCode(mailCode);

			List<MailVO> mailInfoList = mailDAO.selectMailInfoByMailCode(mailCode);

			EmployeeVO emp = employeeService.getEmployeeByEmpCode(mailInfoList.get(0).getMailFrom());
			mail.setMailFromEmp(emp);

			for (MailVO mailVO : mailInfoList) {
				mail.setMailStatus(mailVO.getMailStatus());
			}

			List<MailVO> mailRefList = mailDAO.selectMailRefbyMailCode(mailCode);
			for (MailVO mailref : mailRefList) {
				if(mailref.getMailRefEmpcode() == cri.getLoginUser()) {
					mail.setMailStatus(mailref.getMailRefStatus());
				}
			}

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

			mailList.add(mail);
		}

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(totalCnt);

		dataMap.put("mailList", mailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getStoreMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<String> mailCodeList = mailDAO.selectStoreMailCode(cri);

		int totalCnt = mailDAO.selectStoreMailCodeCount(cri);

		List<MailVO> mailList = new ArrayList<>();

		for (String mailCode : mailCodeList) {
			MailVO mail = mailDAO.selectMailbyMailCode(mailCode);

			List<MailVO> mailInfoList = mailDAO.selectMailInfoByMailCode(mailCode);

			EmployeeVO emp = employeeService.getEmployeeByEmpCode(mailInfoList.get(0).getMailFrom());
			mail.setMailFromEmp(emp);

			for (MailVO mailVO : mailInfoList) {
				mail.setMailStatus(mailVO.getMailStatus());
			}

			List<MailVO> mailRefList = mailDAO.selectMailRefbyMailCode(mailCode);
			for (MailVO mailref : mailRefList) {
				if(mailref.getMailRefEmpcode() == cri.getLoginUser()) {
					mail.setMailStatus(mailref.getMailRefStatus());
				}
			}

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

			mailList.add(mail);
		}

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(totalCnt);

		dataMap.put("mailList", mailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public MailVO getMailbyMailCode(String mailCode, String loginUserEmpCode) throws SQLException {

		MailVO mail = mailDAO.selectMailbyMailCode(mailCode);

		List<MailVO> mailinfoList = mailDAO.selectMailInfoByMailCode(mailCode);

		List<EmployeeVO> empToList = new ArrayList<>();
		for (MailVO mailVO : mailinfoList) {
			EmployeeVO empTo = employeeService.getEmployeeByEmpCode(mailVO.getMailTo());
			empToList.add(empTo);

			if(mailVO.getMailTo().equals(loginUserEmpCode)) {
				mailDAO.updateStatus(mailVO);
			}

			if(empTo.getEmpCode().equals(mailVO.getMailFrom())) {
				mail.setMailTo(empTo.getEmpCode());
			}

		}
		mail.setMailToEmpList(empToList);

		mail.setMailFrom(mailinfoList.get(0).getMailFrom());

		EmployeeVO empFrom = employeeService.getEmployeeByEmpCode(mailinfoList.get(0).getMailFrom());
		mail.setMailFromEmp(empFrom);


		List<MailVO> mailRefList = mailDAO.selectMailRefbyMailCode(mailCode);
		List<EmployeeVO> empRefList = new ArrayList<>();
		for (MailVO mailVO : mailRefList) {
			EmployeeVO empRef = employeeService.getEmployeeByEmpCode(mailVO.getMailRefEmpcode());
			empRefList.add(empRef);

			if(mailVO.getMailRefEmpcode().equals(loginUserEmpCode)) {
				mailDAO.updateRefStatus(mailVO);
			}
		}
		mail.setMailRefEmpList(empRefList);

		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
		mail.setAttachList(attachList);

		return mail;
	}


	@Override
	public void modifyMailImportance(String mailCode) throws SQLException {

		MailVO mail = mailDAO.selectMailbyMailCode(mailCode);

		mailDAO.updateMailImportance(mail);
	}

	@Override
	public String modifyMail(MailVO mail) throws SQLException {
		String sort = null;

		mailDAO.updateMail(mail);

		String mailCode = mail.getMailCode();

		mailDAO.deleteMailInfo(mailCode);
		mailDAO.deleteMailRef(mailCode);


		if(mail.getMailToEmpCodeList() != null && !mail.getMailToEmpCodeList().isEmpty()) {
			for (String empCode : mail.getMailToEmpCodeList()) {
				mail.setMailCode(mailCode);
				mail.setMailTo(empCode);
				mailDAO.insertMailInfo(mail);

				if(mail.getMailTemp().equals("N")) {
					if(!mail.getMailTo().equals(mail.getMailFrom())) {
						// 보낸 메일 알림 추가
						NotificationVO noti = new NotificationVO(mailCode, mail.getMailFrom(),"mail/detail?mailCode=" + mailCode + "&kindOfMail=recieved&from=main", empCode,
								"메일이 도착했습니다.", "far fa-envelope", "새로운 메일");
						if(mail.getMailImportance().equals("Y")) {
							noti.setNtImportant("Y");
						}
						notificationService.registerNotification(noti);
					}
				}
			}
		}

		if(mail.getMailRefEmpCodeList() != null && !mail.getMailRefEmpCodeList().isEmpty()) {
			for (String empCode : mail.getMailRefEmpCodeList()) {
				mail.setMailCode(mailCode);
				mail.setMailRefEmpcode(empCode);
				mailDAO.insertMailRef(mail);

				if(mail.getMailTemp().equals("N")) {
					NotificationVO noti = new NotificationVO(mailCode, mail.getMailFrom(), "mail/detail?mailCode=" + mailCode + "&kindOfMail=recieved", empCode,
							"메일에 참조되었습니다.", "far fa-envelope", "참조된 메일");
					if(mail.getMailImportance().equals("Y")) {
						noti.setNtImportant("Y");
					}
					notificationService.registerNotification(noti);
				}
			}
		}

		if(mail.getAttachList() != null) {
			for (AttachmentVO attach : mail.getAttachList()) {
				attach.setAttachGroup(mailCode);    // 첨부파일에 넣을 PK
				attach.setAttachRegister(mail.getMailFrom()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}




	    if(mail.getMailTo() != null && mail.getMailTo().equals(mail.getMailFrom())) {
            sort = "FromMe";
        } else {
            sort = "normal";
        }

        return sort;
	}



	@Override
	public void modifyTrash(String mailCode, String loginUserEmpCode, String trash) throws SQLException {
		List<MailVO> mailInfoList = mailDAO.selectMailInfoByMailCode(mailCode);
		for (MailVO mailVO : mailInfoList) {
			if(mailVO.getMailTo().equals(loginUserEmpCode)) {
				mailVO.setMailtTrash(trash);
				mailDAO.updateTTrash(mailVO);
			}

			if(mailVO.getMailFrom().equals(loginUserEmpCode)) {
				mailVO.setMailfTrash(trash);
				mailDAO.updateFTrash(mailVO);
			}
		}

		List<MailVO> mailRefList = mailDAO.selectMailRefbyMailCode(mailCode);
		for (MailVO mailVO : mailRefList) {
			if(mailVO.getMailRefEmpcode().equals(loginUserEmpCode)) {
				mailVO.setMailRefTrash(trash);
				mailDAO.updateRefTrash(mailVO);
			}
		}
	}


	@Override
	public void modifyStore(String mailCode, String loginUserEmpCode, String store) throws SQLException {
		List<MailVO> mailInfoList = mailDAO.selectMailInfoByMailCode(mailCode);
		for (MailVO mailVO : mailInfoList) {
			if(mailVO.getMailTo().equals(loginUserEmpCode)) {
				mailVO.setMailtStore(store);
				mailDAO.updateTStore(mailVO);
			}

			if(mailVO.getMailFrom().equals(loginUserEmpCode)) {
				mailVO.setMailfStore(store);
				mailDAO.updateFStore(mailVO);
			}
		}

		List<MailVO> mailRefList = mailDAO.selectMailRefbyMailCode(mailCode);
		for (MailVO mailVO : mailRefList) {
			if(mailVO.getMailRefEmpcode().equals(loginUserEmpCode)) {
				mailVO.setMailRefStore(store);
				mailDAO.updateRefStore(mailVO);
			}
		}
	}

	@Override
	public Map<String, Integer> selectMailMailCount(MailCriteria cri) throws SQLException {

		Map<String, Integer> countMap = new HashMap<>();

		int recievedMailCnt = mailDAO.selectRecievedMailListCount(cri);

		int recievedNotReadCnt = mailDAO.selectRecievedMailListNotReadCount(cri);

		int importMailCnt = mailDAO.selectImportMailListCount(cri);

		countMap.put("recievedMailCnt", recievedMailCnt);
		countMap.put("recievedNotReadCnt", recievedNotReadCnt);
		countMap.put("importMailCnt", importMailCnt);

		return countMap;
	}

	@Override
	public Map<String, Object> getNotReadMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MailVO> recievedMailList = mailDAO.selectRecievedMailListNotRead(cri);

		int totalCount = mailDAO.selectRecievedMailListCount(cri);

		int notReadMailCount = mailDAO.selectRecievedMailListNotReadCount(cri);

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(notReadMailCount);


		for (MailVO mail : recievedMailList){

			List<MailVO> mailInfo = mailDAO.selectMailInfoByMailCode(mail.getMailCode());
			EmployeeVO fromEmp = employeeService.getEmployeeByEmpCode(mailInfo.get(0).getMailFrom());
			mail.setMailFromEmp(fromEmp);

			if(mailInfo != null) {
				for (MailVO mailVO : mailInfo) {
					if(mailVO.getMailTo().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailStatus());
					}
				}
			}

			List<MailVO> refList = mailDAO.selectMailRefbyMailCode(mail.getMailCode());
			if(refList != null) {
				for (MailVO mailVO : refList) {
					if(mailVO.getMailRefEmpcode().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailRefStatus());
					}
				}
			}
			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

		}

		dataMap.put("totalCount", totalCount);
		dataMap.put("notReadMailCount", notReadMailCount);
		dataMap.put("recievedMailList", recievedMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getImportMailList(MailCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<MailVO> recievedMailList = mailDAO.selectImportMailList(cri);

		int totalCount = mailDAO.selectRecievedMailListCount(cri);

		int notReadMailCount = mailDAO.selectRecievedMailListNotReadCount(cri);

		int importCnt = mailDAO.selectImportMailListCount(cri);

		MailPageMaker pageMaker = new MailPageMaker();
		pageMaker.setMailCri(cri);
		pageMaker.setTotalCount(importCnt);


		for (MailVO mail : recievedMailList){

			List<MailVO> mailInfo = mailDAO.selectMailInfoByMailCode(mail.getMailCode());
			EmployeeVO fromEmp = employeeService.getEmployeeByEmpCode(mailInfo.get(0).getMailFrom());
			mail.setMailFromEmp(fromEmp);

			if(mailInfo != null) {
				for (MailVO mailVO : mailInfo) {
					if(mailVO.getMailTo().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailStatus());
					}
				}
			}

			List<MailVO> refList = mailDAO.selectMailRefbyMailCode(mail.getMailCode());
			if(refList != null) {
				for (MailVO mailVO : refList) {
					if(mailVO.getMailRefEmpcode().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailRefStatus());
					}
				}
			}
			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

		}

		dataMap.put("totalCount", totalCount);
		dataMap.put("notReadMailCount", notReadMailCount);
		dataMap.put("recievedMailList", recievedMailList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public List<MailVO> getNotReadMailListForMain(MailCriteria cri) throws SQLException {

		List<MailVO> mailList = mailDAO.selectRecievedMailListNotRead(cri);

		for (MailVO mail : mailList){

			List<MailVO> mailInfo = mailDAO.selectMailInfoByMailCode(mail.getMailCode());
			EmployeeVO fromEmp = employeeService.getEmployeeByEmpCode(mailInfo.get(0).getMailFrom());
			mail.setMailFromEmp(fromEmp);

			if(mailInfo != null) {
				for (MailVO mailVO : mailInfo) {
					if(mailVO.getMailTo().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailStatus());
					}
				}
			}

			List<MailVO> refList = mailDAO.selectMailRefbyMailCode(mail.getMailCode());
			if(refList != null) {
				for (MailVO mailVO : refList) {
					if(mailVO.getMailRefEmpcode().equals(cri.getLoginUser())) {
						mail.setMailStatus(mailVO.getMailRefStatus());
					}
				}
			}
			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(mail.getMailCode());
			mail.setAttachList(attachList);

		}

		return mailList;
	}



}
