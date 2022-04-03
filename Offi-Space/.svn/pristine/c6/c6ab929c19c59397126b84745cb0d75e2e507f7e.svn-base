package kr.co.offispace.service.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.PageMaker;
import kr.co.offispace.dao.notice.NoticeDAO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NoticeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;

public class NoticeServiceImpl implements NoticeService{

	private NoticeDAO noticeDAO;
	private EmployeeService employeeService;
	private AttachmentService attachService;

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public void setAttachService(AttachmentService attachService) {
		this.attachService = attachService;
	}

	@Override
	public String getNoticeCode() throws SQLException {
		return noticeDAO.selectNoticeCode();
	}

	private NotificationService notificationService;

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	@Override
	public String registerNotice(NoticeVO notice) throws SQLException {
		String noticeCode = noticeDAO.selectNoticeCode();
		notice.setNoticeCode(noticeCode);

		if(notice.getAttachList() != null && !notice.getAttachList().isEmpty()) {
			for (AttachmentVO attach : notice.getAttachList()) {
				attach.setAttachGroup(noticeCode);    // 첨부파일에 넣을 PK
				attach.setAttachRegister(notice.getNoticeWriter()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}


		if(notice.getNoticeImportance().equals("Y")) {
//			List<String> empCodeList = employeeService.getEmployeeAllList();
//			for (String empCode : empCodeList) {
//				NotificationVO noti = new NotificationVO(noticeCode, notice.getNoticeWriter(),
//						"notice/detail.do?from=noti&noticeCode=" + noticeCode, empCode,
//						"[필독] " + notice.getNoticeTitle(), "fa-solid fa-bullhorn", "사내공지");
//				notificationService.registerNotification(noti);

//			}
			
			// 발표용 사내일정 알림
			
			NotificationVO noti = new NotificationVO(noticeCode, notice.getNoticeWriter(),
					"notice/detail.do?from=noti&noticeCode=" + noticeCode, "OP0471",
					"[필독] " + notice.getNoticeTitle(), "fa-solid fa-bullhorn", "사내공지");
			notificationService.registerNotification(noti);
			
		}

		noticeDAO.insertNotice(notice);

		return noticeCode;
	}

	@Override
	public void modifyNotice(NoticeVO notice) throws SQLException {

		if(notice.getAttachList() != null && !notice.getAttachList().isEmpty()) {
			for (AttachmentVO attach : notice.getAttachList()) {
				attach.setAttachGroup(notice.getNoticeCode());    // 첨부파일에 넣을 PK
				attach.setAttachRegister(notice.getNoticeWriter()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}

		noticeDAO.updateNotice(notice);
	}

	@Override
	public void removeNotice(String noticeCode) throws SQLException {
		noticeDAO.deleteNotice(noticeCode);
	}

	@Override
	public Map<String, Object> getNoticeList(Criteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<NoticeVO> noticeList = noticeDAO.selectNoticeList(cri);
		int totalCount = noticeDAO.selectNoticeListCount(cri);

		for (NoticeVO notice : noticeList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(notice.getNoticeWriter());
			notice.setWriterEmp(emp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(notice.getNoticeCode());
			notice.setAttachList(attachList);
		}

		
		Criteria imptCri = new Criteria();
		imptCri.setPerPageNum(5);
		List<NoticeVO> noticeImpList = noticeDAO.selectNoticeImptList(imptCri);
		for (NoticeVO noticeImpt : noticeImpList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(noticeImpt.getNoticeWriter());
			noticeImpt.setWriterEmp(emp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(noticeImpt.getNoticeCode());
			noticeImpt.setAttachList(attachList);
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		dataMap.put("noticeList", noticeList);
		dataMap.put("noticeImptList", noticeImpList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public Map<String, Object> getNoticeImptList(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<NoticeVO> noticeImpList = noticeDAO.selectNoticeImptList(cri);

		for (NoticeVO noticeImpt : noticeImpList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(noticeImpt.getNoticeWriter());
			noticeImpt.setWriterEmp(emp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(noticeImpt.getNoticeCode());
			noticeImpt.setAttachList(attachList);
		}
		dataMap.put("noticeImpList", noticeImpList);

		return dataMap;
	}


	@Override
	public NoticeVO getNoticeByNoticeCode(String noticeCode) throws SQLException {
		NoticeVO notice = noticeDAO.selectNoticeByNoticeCode(noticeCode);

		EmployeeVO emp = employeeService.getEmployeeByEmpCode(notice.getNoticeWriter());
		notice.setWriterEmp(emp);

		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(notice.getNoticeCode());
		notice.setAttachList(attachList);

		return notice;
	}

	@Override
	public void increaseViewCnt(String noticeCode) throws SQLException {
		noticeDAO.increaseViewCnt(noticeCode);
	}


}
