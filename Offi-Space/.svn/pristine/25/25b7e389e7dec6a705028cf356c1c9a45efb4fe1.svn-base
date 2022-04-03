package kr.co.offispace.service.approval;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import kr.co.offispace.command.ApprovalCriteria;
import kr.co.offispace.command.ApprovalPageMaker;
import kr.co.offispace.command.ApprovalProcessCommand;
import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.MailPageMaker;
import kr.co.offispace.dao.approval.ApprovalDAO;
import kr.co.offispace.dto.ApprovalCertifyVO;
import kr.co.offispace.dto.ApprovalFormVO;
import kr.co.offispace.dto.ApprovalLineVO;
import kr.co.offispace.dto.ApprovalVO;
import kr.co.offispace.dto.ApvAgencyVO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.JApprovalLineVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;

public class ApprovalServiceImpl implements ApprovalService{

	private ApprovalDAO approvalDAO;

	public void setApprovalDAO(ApprovalDAO approvalDAO) {
		this.approvalDAO = approvalDAO;
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
	public void registerCertify(ApprovalCertifyVO approvalCertify) throws SQLException {
		approvalDAO.insertCertify(approvalCertify);
	}

	@Override
	public void modifyCertify(ApprovalCertifyVO approvalCertify) throws SQLException {
		approvalDAO.updateCertify(approvalCertify);
	}

	@Override
	public ApprovalCertifyVO getCertify(String empCode) throws SQLException {
		return approvalDAO.selectCertify(empCode);
	}

	@Override
	public void registerApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException {
		approvalDAO.insertApprovalPwd(approvalCertify);
	}

	@Override
	public void modifyApprovalPwd(ApprovalCertifyVO approvalCertify) throws SQLException {
		approvalDAO.updateApprovalPwd(approvalCertify);
	}

	@Override
	public void registerApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException {
		approvalDAO.insertApprovalOtp(approvalCertify);
	}

	@Override
	public void modifyApprovalOtp(ApprovalCertifyVO approvalCertify) throws SQLException {
		approvalDAO.updateApprovalOtp(approvalCertify);
	}

	@Override
	public String getApvPwdByEmpCode(String empCode) throws SQLException {
		return approvalDAO.selectApvPwdByEmpCode(empCode);
	}

	@Override
	public String getOtpKeyByEmpCode(String empCode) throws SQLException {
		return approvalDAO.selectOtpKeyByEmpCode(empCode);
	}

	@Override
	public List<ApprovalFormVO> getApprovalForm() throws SQLException {
		return approvalDAO.selectApprovalForm();
	}

	@Override
	public List<ApprovalFormVO> getApvFormGr() throws SQLException {
		return approvalDAO.selectApvFormGr();
	}

	@Override
	public List<ApprovalFormVO> getApvFormByFormGr(String apvFormGr) throws SQLException {
		return approvalDAO.selectApvFormByFormGr(apvFormGr);
	}

	@Override
	public ApprovalFormVO getApvFormByFormCode(String apvFormCode) throws SQLException {
		return approvalDAO.selectApvFormByFormCode(apvFormCode);
	}

	@Override
	public void registerApproval(ApprovalVO apv) throws SQLException {
		// 결재코드 불러오기
		String apvCode = approvalDAO.selectApcCodeNextVal();
		String draftEmpCode = apv.getEmpCode();
		String temp = apv.getApvTemporary();

		// 결재 집어넣기
		apv.setApvCode(apvCode);
		approvalDAO.insertApproval(apv);

		// 결재선 집어넣기 - apvVO에서 꺼내서 for문 돌리기
		for(ApprovalLineVO apvLine : apv.getApvLineList()) {
			apvLine.setApvCode(apvCode);
			approvalDAO.insertApprovalLine(apvLine);
		}

		if(apv.getAttachList() != null && !apv.getAttachList().isEmpty()) {
			for (AttachmentVO attach : apv.getAttachList()) {
				attach.setAttachGroup(apvCode);    // 첨부파일에 넣을 PK
				attach.setAttachRegister(apv.getEmpCode()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}

		if(temp.equals("N")) {
			// 첫번째 결재자에게 알림 보내기
			List<ApprovalLineVO> apvLineList = approvalDAO.selectNowApvLine(apvCode);
			if(apvLineList != null && !apvLineList.isEmpty()) {
				NotificationVO noti = new NotificationVO(apvCode, draftEmpCode, "approval/waitDetail?from=noti&apvCode=" + apvCode, apvLineList.get(0).getEmpCode(),
						"결재를 부탁드립니다.", "fas fa-file-signature", "결재요청");
				if(apv.getApvEmergency().equals("Y")) {
					noti.setNtImportant("Y");
				}
				notificationService.registerNotification(noti);
			}

			// 합의자에게 알림 보내기
			List<String> habEmpCode = approvalDAO.selectHabLineList(apvCode);
			if(habEmpCode != null && !habEmpCode.isEmpty()) {
				for (String empCode : habEmpCode) {
					NotificationVO noti = new NotificationVO(apvCode, draftEmpCode, "approval/waitDetail?from=noti&apvCode=" + apvCode, empCode,
							"결재 합의를 부탁드립니다.", "fas fa-file-signature", "결재합의요청");
					if(apv.getApvEmergency().equals("Y")) {
						noti.setNtImportant("Y");
					}
					notificationService.registerNotification(noti);
				}
			}
		}
	}

	@Override
	public Map<String, Object> getApprovalTempList(ApprovalCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ApprovalVO> tempList = approvalDAO.selectTempApvList(cri);

		int totalCnt = approvalDAO.selectTempApvListCount(cri);

		ApprovalPageMaker pageMaker = new ApprovalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCnt);

		for (ApprovalVO apv : tempList) {
			apv.setDratfEmp(employeeService.getEmployeeByEmpCode(apv.getEmpCode()));
			apv.setApvForm(approvalDAO.selectApvFormByFormCode(apv.getApvFormCode()));
		}

		dataMap.put("tempList", tempList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getApprovalByApvCode(ApprovalCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		//페이지네이션
		int totalCount = approvalDAO.selectWaitApvListCount(cri);
		ApprovalPageMaker pageMaker =  new ApprovalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);


		//내가 속한 대기상태 결재의 결재코드 다 불러오기
		List<String> approvalCodeList = approvalDAO.selectApvCodeByEmpCodeFromApvLine(cri);

		//내가 결재선에 있는 대기상태 결재문서들
		List<ApprovalVO> approvalList = new ArrayList<>();

		//결재코드에 맞는 결재문서 VO를 approval리스트에 담기
		for(String apvCode : approvalCodeList) {
			ApprovalVO approvalDoc = approvalDAO.selectAppovalByApvCode(apvCode);

			approvalDoc.setDratfEmp(employeeService.getEmployeeByEmpCode(approvalDoc.getEmpCode()));
			approvalDoc.setApvForm(approvalDAO.selectApvFormByFormCode(approvalDoc.getApvFormCode()));

			List<ApprovalLineVO> apvNowList = approvalDAO.selectNowApvLine(apvCode);
			EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(apvNowList.get(0).getEmpCode());
			approvalDoc.setNowEmp(nowEmp);

			approvalList.add(approvalDoc);
		}

		dataMap.put("approvalList", approvalList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public ApprovalVO getApprovalByApvCode2(String apvCode) throws SQLException {
		ApprovalVO approval = approvalDAO.selectAppovalByApvCode(apvCode);
		
		approval.setDratfEmp(employeeService.getEmployeeByEmpCode(approval.getEmpCode()));
		approval.setApvForm(approvalDAO.selectApvFormByFormCode(approval.getApvFormCode()));

		List<ApprovalLineVO> apvLineList = approvalDAO.selectApprovalLine(apvCode);
		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(apvCode);

		approval.setAttachList(attachList);
		approval.setApvLineList(apvLineList);

		if(!approval.getApvState().equals("J103")) {
			List<ApprovalLineVO> apvNowList = approvalDAO.selectNowApvLine(apvCode);
			EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(apvNowList.get(0).getEmpCode());
			approval.setNowEmp(nowEmp);
		}

		return approval;
	}


	@Override
	public ApprovalVO getApprovalByApvCode(String apvCode) throws SQLException {
		ApprovalVO apv = approvalDAO.selectApproval(apvCode);

		List<ApprovalLineVO> apvLineList = approvalDAO.selectApprovalLine(apvCode);
		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(apvCode);

		apv.setAttachList(attachList);
		apv.setApvLineList(apvLineList);

		apv.setApvForm(approvalDAO.selectApvFormByFormCode(apv.getApvFormCode()));

		EmployeeVO emp = employeeService.getEmployeeByEmpCode(apv.getEmpCode());
		apv.setDratfEmp(emp);

		for (ApprovalLineVO apvLine : apvLineList) {
			emp = employeeService.getEmployeeByEmpCode(apvLine.getEmpCode());
			apvLine.setLineEmp(emp);
		}

		if(!apv.getApvState().equals("J103")) {
			List<ApprovalLineVO> apvNowList = approvalDAO.selectNowApvLine(apv.getApvCode());
			if (apvNowList != null && apvNowList.size() > 0) {
				EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(apvNowList.get(0).getEmpCode());
				apv.setNowEmp(nowEmp);
			}
		}else {
			// 완료면 최종 결재자 보이게 하기
			String empCode = approvalDAO.selectFinalEmpCodeByApvCode(apv.getApvCode());
			EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(empCode);
			apv.setNowEmp(nowEmp);
		}

		return apv;
	}


	@Override
	public void modifyApproval(ApprovalVO apv) throws SQLException {
		approvalDAO.deleteApvLine(apv.getApvCode());

		approvalDAO.updateApproval(apv);

		for (ApprovalLineVO apvLine : apv.getApvLineList()) {
			apvLine.setApvCode(apv.getApvCode());
			approvalDAO.insertApprovalLine(apvLine);
		}

		if(apv.getAttachList() != null && !apv.getAttachList().isEmpty()) {
			for (AttachmentVO attach : apv.getAttachList()) {
				attach.setAttachGroup(apv.getApvCode());    // 첨부파일에 넣을 PK
				attach.setAttachRegister(apv.getEmpCode()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}
	}

	@Override
	public int getMyApvLineOrder(ApprovalLineVO apvLine) throws SQLException {
		return approvalDAO.selectMyApvLineOrder(apvLine);
	}

	@Override
	public void registerJApvLine(JApprovalLineVO jApvLine) throws SQLException {
		approvalDAO.insertJApvLine(jApvLine);
	}

	@Override
	public void registerJApvLineInfo(JApprovalLineVO jApvLine) throws SQLException {
		approvalDAO.insertJApvLineInfo(jApvLine);
	}

	@Override
	public String getJApvSeqNextval() throws SQLException {
		return approvalDAO.selectApcCodeNextVal();
	}

	@Override
	public List<JApprovalLineVO> jApvLineList(String empCode) throws SQLException {
		return approvalDAO.selectJApvLine(empCode);
	}

	@Override
	public List<JApprovalLineVO> getJApvLineInfo(String jApvLineCode) throws SQLException {
		return approvalDAO.selectJApvLineInfo(jApvLineCode);
	}

	@Override
	public void removeJApprovalLine(String jApvLineCode) throws SQLException {
		approvalDAO.deleteJApvLine(jApvLineCode);
		approvalDAO.deleteJApvLineInfo(jApvLineCode);
	}

	@Override
	public void modifyApprovalForProcess(ApprovalProcessCommand apvProCmd) throws SQLException {
		approvalDAO.updateApprovalForProcess(apvProCmd);
	}

	@Override
	public void modifyApprovalLineForProcess(ApprovalProcessCommand apvProCmd) throws SQLException {

		String apvCode = apvProCmd.getApvCode();
		int lineOrder = apvProCmd.getApvLineOrder();

		approvalDAO.updateApprovalLineForProcess(apvProCmd);

		ApprovalLineVO apvLine = new ApprovalLineVO();
		apvLine.setApvCode(apvCode);
		apvLine.setApvLineOrder(lineOrder);

		String empCode = approvalDAO.selectNextApvEmpCode(apvLine);

		if(empCode != null && !empCode.isEmpty()) {

			ApprovalVO apv = approvalDAO.selectAppovalByApvCode(apvCode);

			NotificationVO noti = new NotificationVO(apvCode, apv.getEmpCode(), "approval/waitDetail?from=noti&apvCode=" + apvCode, empCode,
					"결재를 부탁드립니다.", "fas fa-file-signature", "결재요청");
			if(apv.getApvEmergency().equals("Y")) {
				noti.setNtImportant("Y");
			}
			notificationService.registerNotification(noti);
		}
	}

	@Override
	public int getLastApvOrder(String apvCode) throws SQLException {
		return approvalDAO.selectLastApvOrder(apvCode);
	}

	@Override
	public Map<String, Object> getRefApprovalByApvCode(ApprovalCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		//페이지네이션
		int totalCount = approvalDAO.selectRefApvListCount(cri);
		ApprovalPageMaker pageMaker = new ApprovalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);


		// 참조/열람함 리스트 결재코드 다 불러오기
		List<String> approvalCodeList = approvalDAO.selectRefApvList(cri);

		//내가 결재선에 있는 대기상태 결재문서들
		List<ApprovalVO> apvRefList = new ArrayList<>();

		//결재코드에 맞는 결재문서 VO를 approval리스트에 담기
		for(String apvCode : approvalCodeList) {
			ApprovalVO approvalDoc = approvalDAO.selectAppovalByApvCode(apvCode);

			approvalDoc.setDratfEmp(employeeService.getEmployeeByEmpCode(approvalDoc.getEmpCode()));
			approvalDoc.setApvForm(approvalDAO.selectApvFormByFormCode(approvalDoc.getApvFormCode()));

			List<ApprovalLineVO> apvNowList = approvalDAO.selectNowApvLine(apvCode);
			EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(apvNowList.get(0).getEmpCode());
			approvalDoc.setNowEmp(nowEmp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(apvCode);

			approvalDoc.setAttachList(attachList);

			apvRefList.add(approvalDoc);

		}

		dataMap.put("apvRefList", apvRefList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getCompleteApprovalByApvCode(ApprovalCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		//페이지네이션
		int totalCount = approvalDAO.selectCompleteApvListCount(cri);
		ApprovalPageMaker pageMaker = new ApprovalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);


		// 결재완료함 리스트 결재코드 다 불러오기
		List<String> approvalCodeList = approvalDAO.selectCompleteApvList(cri);

		//내가 결재선에 있는 완료상태 결재문서들
		List<ApprovalVO> apvCompleteList = new ArrayList<>();

		//결재코드에 맞는 결재문서 VO를 approval리스트에 담기
		for(String apvCode : approvalCodeList) {
			ApprovalVO approvalDoc = approvalDAO.selectAppovalByApvCode(apvCode);

			approvalDoc.setDratfEmp(employeeService.getEmployeeByEmpCode(approvalDoc.getEmpCode()));
			approvalDoc.setApvForm(approvalDAO.selectApvFormByFormCode(approvalDoc.getApvFormCode()));

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(apvCode);
			approvalDoc.setAttachList(attachList);

			apvCompleteList.add(approvalDoc);
		}

		dataMap.put("apvCompleteList", apvCompleteList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public void registerApvAgency(ApvAgencyVO agency) throws SQLException {
		approvalDAO.insertAgency(agency);
	}

	@Override
	public List<ApvAgencyVO> getAgencyList(String empCode) throws SQLException {

		List<ApvAgencyVO> agencyList = approvalDAO.selectAgencyList(empCode);

		for (ApvAgencyVO agency : agencyList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(agency.getGiveEmpCode());
			agency.setToEmp(emp);
		}

		return agencyList;
	}

	@Override
	public Map<String, Object> getRefuseApvList(ApprovalCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ApprovalVO> refuseList = approvalDAO.selectRefuseApvList(cri);

		int totalCnt = approvalDAO.selectRefuseApvListCount(cri);

		ApprovalPageMaker pageMaker = new ApprovalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCnt);

		for (ApprovalVO apv : refuseList) {
			apv.setDratfEmp(employeeService.getEmployeeByEmpCode(apv.getEmpCode()));
			apv.setApvForm(approvalDAO.selectApvFormByFormCode(apv.getApvFormCode()));

			String empCode = approvalDAO.selectRefuseEmpCode(apv.getApvCode());
			EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(empCode);
			apv.setNowEmp(nowEmp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(apv.getApvCode());
			apv.setAttachList(attachList);
		}

		dataMap.put("refuseList", refuseList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public Map<String, Object> getRequestApvList(ApprovalCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ApprovalVO> requestList = approvalDAO.selectRequestApvList(cri);

		int totalCnt = approvalDAO.selectRequestApvListCount(cri);

		ApprovalPageMaker pageMaker = new ApprovalPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCnt);

		for (ApprovalVO apv : requestList) {
			apv.setDratfEmp(employeeService.getEmployeeByEmpCode(apv.getEmpCode()));
			apv.setApvForm(approvalDAO.selectApvFormByFormCode(apv.getApvFormCode()));
			if(!apv.getApvState().equals("J103")) {
				List<ApprovalLineVO> apvNowList = approvalDAO.selectNowApvLine(apv.getApvCode());
				if (apvNowList != null && apvNowList.size() > 0) {
					EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(apvNowList.get(0).getEmpCode());
					apv.setNowEmp(nowEmp);
				}
			}else {
				// 완료면 최종 결재자 보이게 하기
				String empCode = approvalDAO.selectFinalEmpCodeByApvCode(apv.getApvCode());
				EmployeeVO nowEmp = employeeService.getEmployeeByEmpCode(empCode);
				apv.setNowEmp(nowEmp);
			}

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(apv.getApvCode());
			apv.setAttachList(attachList);

			apv.setStateValue(approvalDAO.selectApvState(apv.getApvState()));
		}

		dataMap.put("requestList", requestList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void modifyApvForAgain(ApprovalVO apv) throws SQLException {
		approvalDAO.deleteApvLine(apv.getApvCode());

		approvalDAO.updateApvForAgain(apv);

		for (ApprovalLineVO apvLine : apv.getApvLineList()) {
			apvLine.setApvCode(apv.getApvCode());
			approvalDAO.insertApprovalLine(apvLine);
		}
	}

	@Override
	public List<ApprovalVO> getListForMain(String empCode) throws SQLException {

		List<ApprovalVO> list = approvalDAO.selectListForMain(empCode);

		return list;
	}

	@Override
	public Map<String, Integer> getMainCnt(ApprovalCriteria cri) throws SQLException {

		Map<String, Integer> map = new HashMap<String, Integer>();

		int refuseCnt = approvalDAO.selectRefuseApvListCount(cri);
		int tempCnt = approvalDAO.selectTempApvListCount(cri);
		int requestCnt = approvalDAO.selectRequestApvListCount(cri);
		cri.setSearchType("apvIng");
		int ingCnt = approvalDAO.selectWaitApvListCount(cri);
		cri.setSearchType("apvYet");
		int waitCnt = approvalDAO.selectWaitApvListNowCount(cri);
		cri.setSearchType("hapYet");
		int habCnt = approvalDAO.selectWaitApvListHapCount(cri);

		map.put("refuseCnt", refuseCnt);
		map.put("tempCnt", tempCnt);
		map.put("requestCnt", requestCnt);
		map.put("ingCnt", ingCnt);
		map.put("waitCnt", waitCnt);
		map.put("habCnt", habCnt);

		return map;
	}

	@Override
	public ApvAgencyVO getAgency(String empCode) throws SQLException {

		ApvAgencyVO apv = approvalDAO.selectAgency(empCode);

		if(apv != null) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(apv.getEmpCode());

			EmployeeVO giveEmp = employeeService.getEmployeeByEmpCode(apv.getGiveEmpCode());

			apv.setFromEmp(emp);
			apv.setToEmp(giveEmp);
		}

		return apv;
	}

	@Override
	public Map<String, Integer> getApvCount(String empCode) throws SQLException {
		Map<String, String> apvEmpCode = new HashMap<String, String>();
		Map<String, Integer> countMap = new HashMap<String, Integer>();

		apvEmpCode.put("empCode", empCode);
		apvEmpCode.put("searchType", "weeklyWaiting");
		int weeklyWaiting = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("weeklyWaiting",weeklyWaiting);
		System.out.println(weeklyWaiting);

		apvEmpCode.put("searchType", "weeklyWorking");
		int weeklyWorking = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("weeklyWorking",weeklyWorking);
		System.out.println(weeklyWorking);

		apvEmpCode.put("searchType", "weeklyDone");
		int weeklyDone = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("weeklyDone",weeklyDone);
		System.out.println(weeklyDone);

		apvEmpCode.put("searchType", "weeklyTotal");
		int weeklyTotal = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("weeklyTotal",weeklyTotal);
		System.out.println(weeklyTotal);

		apvEmpCode.put("searchType", "monthlyWaiting");
		int monthlyWaiting = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("monthlyWaiting",monthlyWaiting);

		apvEmpCode.put("searchType", "monthlyWorking");
		int monthlyWorking = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("monthlyWorking",monthlyWorking);

		apvEmpCode.put("searchType", "monthlyDone");
		int monthlyDone = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("monthlyDone",monthlyDone);

		apvEmpCode.put("searchType", "monthlyTotal");
		int monthlyTotal = approvalDAO.selectApvCount(apvEmpCode);
		countMap.put("monthlyTotal",monthlyTotal);


		return countMap;
	}



}
