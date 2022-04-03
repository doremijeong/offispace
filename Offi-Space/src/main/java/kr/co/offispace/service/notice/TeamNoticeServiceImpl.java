package kr.co.offispace.service.notice;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.TeamNoticeCriteria;
import kr.co.offispace.command.TeamNoticePageMaker;
import kr.co.offispace.dao.notice.TeamNoticeDAO;
import kr.co.offispace.dto.AttachmentVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.dto.TeamNoticeVO;
import kr.co.offispace.service.attach.AttachmentService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;

public class TeamNoticeServiceImpl implements TeamNoticeService{

	private TeamNoticeDAO teamNoticeDAO;
	private EmployeeService employeeService;
	private AttachmentService attachService;

	public void setTeamNoticeDAO(TeamNoticeDAO teamNoticeDAO) {
		this.teamNoticeDAO = teamNoticeDAO;
	}
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public void setAttachService(AttachmentService attachService) {
		this.attachService = attachService;
	}

	private NotificationService notificationService;

	public void setNotificationService(NotificationService notificationService) {
		this.notificationService = notificationService;
	}

	//==============================================================================


	@Override
	public String getTeamNoticeCode() throws SQLException {
		String teamNoticeCode = teamNoticeDAO.selectTeamNoticeCode();
		return teamNoticeCode;
	}


	@Override
	public String registerTeamNotice(TeamNoticeVO teamNotice) throws SQLException {
		String teamNoticeCode = teamNoticeDAO.selectTeamNoticeCode();
		teamNotice.setTeamNoticeCode(teamNoticeCode);

		String writerCode = teamNotice.getTeamNoticeWriter();
		EmployeeVO employee = employeeService.getEmployeeByEmpCode(writerCode);
		teamNotice.setTeamNoticeTeamcode(employee.getTeamCode());

		List<AttachmentVO> attachList = teamNotice.getAttachList();
		if(attachList != null && !attachList.isEmpty()) {
			for (AttachmentVO attach : attachList) {
				attach.setAttachGroup(teamNoticeCode);    // 첨부파일에 넣을 PK
				attach.setAttachRegister(writerCode); 	  // 등록자
		        attachService.registerAttachment(attach);
		    }
		}


		if(teamNotice.getTeamNoticeImportance().equals("Y")) {
			List<String> empCodeList = employeeService.getMyTeamEmployeeCodeList(employee.getTeamCode());
			for (String empCode : empCodeList) {
				NotificationVO noti = new NotificationVO(teamNoticeCode, teamNotice.getTeamNoticeWriter(),
						"teamNotice/detail.do?from=noti&teamNoticeCode=" + teamNoticeCode, empCode,
						"[필독] " + teamNotice.getTeamNoticeTitle(), "fa-solid fa-bullhorn", "부서공지");
				notificationService.registerNotification(noti);
			}
		}

		teamNoticeDAO.insertTeamNotice(teamNotice);

		return teamNoticeCode;
	}


	@Override
	public Map<String, Object> getTeamNoticeList(TeamNoticeCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<TeamNoticeVO> teamNoticeList = teamNoticeDAO.selectTeamNoticeList(cri);
		List<TeamNoticeVO> teamNoticeImptList = teamNoticeDAO.selectTeamNoticeImptList(cri);
		int totalCount = teamNoticeDAO.selectTeamNoticeListCount(cri);

		for (TeamNoticeVO teamNotice : teamNoticeList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(teamNotice.getTeamNoticeWriter());
			teamNotice.setTeamNoticeEmp(emp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(teamNotice.getTeamNoticeCode());
			teamNotice.setAttachList(attachList);
		}

		for (TeamNoticeVO teamNoticeImpt : teamNoticeImptList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(teamNoticeImpt.getTeamNoticeWriter());
			teamNoticeImpt.setTeamNoticeEmp(emp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(teamNoticeImpt.getTeamNoticeCode());
			teamNoticeImpt.setAttachList(attachList);
		}

		TeamNoticePageMaker TeamNoticePageMaker = new TeamNoticePageMaker();
		TeamNoticePageMaker.setCri(cri);
		TeamNoticePageMaker.setTotalCount(totalCount);

		dataMap.put("teamNoticeList", teamNoticeList);
		dataMap.put("teamNoticeImptList", teamNoticeImptList);
		dataMap.put("pageMaker", TeamNoticePageMaker);

		return dataMap;
	}


	@Override
	public Map<String, Object> getTeamNoticeImptList(TeamNoticeCriteria cri) throws SQLException {

		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<TeamNoticeVO> teamNoticeImptList = teamNoticeDAO.selectTeamNoticeImptList(cri);

		for (TeamNoticeVO teamNoticeImpt : teamNoticeImptList) {
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(teamNoticeImpt.getTeamNoticeWriter());
			teamNoticeImpt.setTeamNoticeEmp(emp);

			List<AttachmentVO> attachList = attachService.getAttachmentListByOther(teamNoticeImpt.getTeamNoticeCode());
			teamNoticeImpt.setAttachList(attachList);
		}
		dataMap.put("teamNoticeImptList", teamNoticeImptList);

		return dataMap;
	}


	@Override
	public TeamNoticeVO getTeamNoticeByCode(String teamNoticeCode) throws SQLException {
		TeamNoticeVO teamNotice = teamNoticeDAO.selectTeamNoticeByCode(teamNoticeCode);

		String writerCode = teamNotice.getTeamNoticeWriter();
		System.out.println(writerCode+"&&&");
		EmployeeVO employee = employeeService.getEmployeeByEmpCode(writerCode);
		teamNotice.setTeamNoticeEmp(employee);

		List<AttachmentVO> attachList = attachService.getAttachmentListByOther(teamNotice.getTeamNoticeCode());
		teamNotice.setAttachList(attachList);

		return teamNotice;
	}


	@Override
	public void modifyTeamNotice(TeamNoticeVO teamNotice) throws SQLException {

		if(teamNotice.getAttachList() != null && !teamNotice.getAttachList().isEmpty()) {
			for (AttachmentVO attach : teamNotice.getAttachList()) {
				attach.setAttachGroup(teamNotice.getTeamNoticeCode());    // 첨부파일에 넣을 PK
				attach.setAttachRegister(teamNotice.getTeamNoticeWriter()); // 등록자
		        attachService.registerAttachment(attach);
		    }
		}

		teamNoticeDAO.updateTeamNotice(teamNotice);
	}


	@Override
	public void removeTeamNotice(String teamNoticeCode) throws SQLException {
		teamNoticeDAO.deleteTeamNotice(teamNoticeCode);
	}
	@Override
	public void increaseViewCnt(String teamNoticeCode) throws SQLException {
		teamNoticeDAO.increaseViewCnt(teamNoticeCode);
	}

}
