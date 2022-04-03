package kr.co.offispace.service.report;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.MessagePageMaker;
import kr.co.offispace.command.PageMaker;
import kr.co.offispace.command.ReportCriteria;
import kr.co.offispace.command.ReportPageMaker;
import kr.co.offispace.command.ReportRegisterCommand;
import kr.co.offispace.dao.report.ReportDAO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.IrregularReportStakeholersDTO;
import kr.co.offispace.dto.ManagerReportDTO;
import kr.co.offispace.dto.MessageVO;
import kr.co.offispace.dto.NotificationVO;
import kr.co.offispace.dto.RegularReportStakeholersDTO;
import kr.co.offispace.dto.ReportDocVO;
import kr.co.offispace.dto.ReportVO;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.notification.NotificationService;
import kr.co.offispace.util.DateDayUtil;

public class ReportServiceImpl implements ReportService {

	private ReportDAO reportDAO;
	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}

	private EmployeeService employeeService;
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	private NotificationService notificationService;
	public void setNotificationService (NotificationService notificationService) {
		this.notificationService = notificationService;
	}


	@Override
	public List<ReportVO> getReportList(Criteria cri) throws SQLException {
		List<ReportVO> reportList = reportDAO.selectReportList(cri);
		for(ReportVO report:reportList) {
			if(!report.getReportType().equals("I")) {
				List<String> reportDay = reportDAO.selectReportDayList(report.getReportCode());
				report.setReportDay(reportDay);
			}
		}
		return reportList;
	}


	@Override
	public ReportVO getReport(Criteria cri) throws SQLException {
		ReportVO report = reportDAO.selectReport(cri);
		return report;
	}
	@Override
	public List<RegularReportStakeholersDTO> getRegularReportList(Criteria cri) throws SQLException {
		List<ReportVO> reportList = reportDAO.selectReportList(cri);
		List<RegularReportStakeholersDTO> regularReportList = setRegularList(reportList);

		return regularReportList;
	}

	@Override
	public List<RegularReportStakeholersDTO> getRegularReportListToWrite(String empCode) throws SQLException {
		List<ReportVO> reportList = reportDAO.selectRegularReportListToWrite(empCode);
		List<RegularReportStakeholersDTO> regularReportListToWrite = setRegularList(reportList);
		return regularReportListToWrite;
	}

	public List<RegularReportStakeholersDTO> setRegularList(List<ReportVO> reportList) throws SQLException{
		List<RegularReportStakeholersDTO> regularReportList = new ArrayList<RegularReportStakeholersDTO>();

		for(ReportVO report : reportList) {
			RegularReportStakeholersDTO regularReport = report.setRegularReportStakeholdersDTO();

			EmployeeVO reportManager = employeeService.getEmployeeByEmpCode(report.getReportManager());
			employeeService.setAttachSavename(reportManager);
			regularReport.setReportManager(reportManager);

			List<String> reportDay = reportDAO.selectReportDayList(report.getReportCode());
			regularReport.setReportDay(reportDay);

			List<EmployeeVO> reportwriters = reportDAO.selectReportWriterList(report.getReportCode());
			System.out.println(reportwriters);
			for(EmployeeVO employee : reportwriters) {

				employeeService.setAttachSavename(employee);
			}
			regularReport.setReportWriters(reportwriters);

			regularReportList.add(regularReport);
		}
		return regularReportList;
	}


	@Override
	public List<IrregularReportStakeholersDTO> getIrregularReportList(String teamCode) throws SQLException {

		List<ReportVO> reportAll = reportDAO.selectIrregularReportListByTeam(teamCode);
		List<IrregularReportStakeholersDTO> reportList =  new ArrayList<IrregularReportStakeholersDTO>();

		for(ReportVO report : reportAll) {

		IrregularReportStakeholersDTO regularReport = report.setIrregularReportStakeholersDTO();

		EmployeeVO emp = employeeService.getEmployeeByEmpCode(report.getReportManager());

		if(emp!=null)
		{
			regularReport.setManagerName(emp.getEmpName());
			regularReport.setManagerCharge(emp.getChargeValue());
			regularReport.setManagerPosition(emp.getPositionValue());
			regularReport.setManagerTeamName(emp.getTeamValue());
		}

		reportList.add(regularReport);

		}

		return reportList;

	}


	@Override
	public String getReportMarkup(String reportCode) throws SQLException {
		String reportMarkup = reportDAO.selectReportMarkup(reportCode);
		return reportMarkup;
	}

	@Override
	public List<ManagerReportDTO> getManagerReportList(Map<String,String> searchTypeDateEmpCode) throws SQLException, ParseException {
		List<ManagerReportDTO> managerReportList = reportDAO.selectManagerReportList(searchTypeDateEmpCode);
		for (ManagerReportDTO report :managerReportList) {

			String reportDay = DateDayUtil.getDateDay(report.getReportDt(),"yyyy-MM-dd");
			report.setReportDay(reportDay);

			Map<String,String> reportCodeAndDt = new HashMap<String, String>();
			reportCodeAndDt.put("reportCode", report.getReportCode());
			reportCodeAndDt.put("reportDt", report.getReportDt());

			List<EmployeeVO> reported = getManagerReportedList(reportCodeAndDt);
			report.setReported(reported);

			List<EmployeeVO> notReported = getManagerNotReportedList(reportCodeAndDt);
			report.setNotReported(notReported);
		}
		return managerReportList;
	}



	@Override
	public ManagerReportDTO getManagerReport(Map<String, String> reportCodeDtEmpCode) throws SQLException, ParseException {
		ManagerReportDTO managerReport = reportDAO.selectManagerReport(reportCodeDtEmpCode);

		String reportDay = DateDayUtil.getDateDay(managerReport.getReportDt(),"yyyy-MM-dd");
		managerReport.setReportDay(reportDay);

		Map<String,String> reportCodeAndDt = new HashMap<String, String>();
		reportCodeAndDt.put("reportCode", managerReport.getReportCode());
		reportCodeAndDt.put("reportDt", managerReport.getReportDt());

		List<EmployeeVO> reported = getManagerReportedList(reportCodeAndDt);
		managerReport.setReported(reported);

		List<EmployeeVO> notReported = getManagerNotReportedList(reportCodeAndDt);
		managerReport.setNotReported(notReported);


		return managerReport;
	}


	@Override
	public List<EmployeeVO> getManagerReportedList(Map<String, String> reportCodeAndDt) throws SQLException {
		List<EmployeeVO> reported = reportDAO.selectManagerReportedList(reportCodeAndDt);
		for(EmployeeVO employee : reported) {
			employeeService.setAttachSavename(employee);
		}
		return reported;
	}

	@Override
	public List<EmployeeVO> getManagerNotReportedList(Map<String, String> reportCodeAndDt) throws SQLException {
		List<EmployeeVO> notReported = reportDAO.selectManagerNotReportedList(reportCodeAndDt);
		for(EmployeeVO employee : notReported) {
			employeeService.setAttachSavename(employee);
		}
		return notReported;
	}


	@Override
	public ReportDocVO getReportFromManager(Map<String, String> empCodeReportCodeReportDt) throws SQLException {
		ReportDocVO reportDocMarkup = reportDAO.selectReportFromManager(empCodeReportCodeReportDt);
		return reportDocMarkup;
	}

	@Override
	public ReportDocVO getReportDocByReportDocCode(String reportDocCode) throws SQLException {
		ReportDocVO reportDoc = reportDAO.selectReportDocByReportDocCode(reportDocCode);

		EmployeeVO reportDocWriterInfo = employeeService.getEmployeeByEmpCode(reportDoc.getReportDocWriter());
		reportDoc.setReportDocWriterInfo(reportDocWriterInfo);

		EmployeeVO reportDocManagerInfo = employeeService.getEmployeeByEmpCode(reportDoc.getManagerEmpCode());
		reportDoc.setReportDocManagerInfo(reportDocManagerInfo);

		return reportDoc;
	}

	@Override
	public void registerReportDoc(ReportDocVO reportDocVO) throws SQLException {

		String reportDocCode = reportDAO.selectReportDocCodeToRegister();
		reportDocVO.setReportDocCode(reportDocCode);
		reportDAO.insertReportDoc(reportDocVO);

		NotificationVO notification = new NotificationVO(reportDocVO.getReportDocCode(), reportDocVO.getReportDocWriter(),"report/reportDetail?reportDocCode="+reportDocVO.getReportDocCode() , reportDocVO.getManagerEmpCode(), "새로운 보고서가 도착했습니다.", "fas fa-file", "새로운 보고");
		notificationService.registerNotification(notification);
	}


	@Override
	public ReportVO getReportInfoForRegistDoc(String reportCode) throws SQLException {

		ReportVO vo = reportDAO.selectReportInfoByEmpcodeForRegistDoc(reportCode);

		return vo;
	}


	@Override
	public Map<String, Object> getReportDocListByEmpCode(Criteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ReportDocVO> reportDocList = reportDAO.selectReportDocListByEmpCode(cri);
		int totalCount = reportDAO.selectReportDocTotalCountByEmpCode(cri.getLoginEmpCode());
		//System.out.println("보고문서 리스트에 뭐 들어갔니? : " + reportDocList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		for(ReportDocVO reportDoc : reportDocList) {

			String empCode = reportDoc.getReportDocWriter();
			//System.out.println("보고문서 작성자 가져오니?? : " + empCode);
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(empCode);

			//System.out.println("보고양식 코드 못들고오니..? : " + reportDoc.getReportCode());
			ReportVO report = reportDAO.selectReportInfoByEmpcodeForRegistDoc(reportDoc.getReportCode());
			//System.out.println("보고 제목 가져오니??: " + report.getReportTitle());

			reportDoc.setReportDocWriterInfo(emp);
			reportDoc.setReportTitle(report.getReportTitle());

			//System.out.println("매니저 코드가 안들어오니???? : " + report.getReportManager());
			EmployeeVO empManager = employeeService.getEmployeeByEmpCode(report.getReportManager());

			reportDoc.setManagerName(empManager.getEmpName());
			reportDoc.setManagerPosition(empManager.getPositionValue());
			reportDoc.setManagerCharge(empManager.getChargeValue());
			reportDoc.setManagerTeamName(empManager.getTeamValue());
			/*reportDoc.setManagerPosition(empManager.getAttachSavename());*/
			//System.out.println("운영자 직급 가져오니?? : " + empManager.getPositionValue());

		}

		dataMap.put("reportDocList", reportDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public Map<String, Integer> getReportDocTotalCountByEmpCode(String empCode) throws SQLException {

		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		int total = reportDAO.selectReportDocTotalCountByEmpCode(empCode);
		resultMap.put("reportCnt", total);

		return resultMap;
	}



	@Override
	public Map<String, Object> getReportDocListByTeamCode(ReportCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ReportDocVO> reportDocList = reportDAO.selectReportDocListByTeamCode(cri);
		int totalCount = reportDAO.selectReportDocTotalCountByTeamCode(cri.getTeamCode());
		//System.out.println("보고문서 리스트에 뭐 들어갔니? : " + reportDocList);

		ReportPageMaker pageMaker = new ReportPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		for(ReportDocVO reportDoc : reportDocList) {

			String empCode = reportDoc.getReportDocWriter();
			//System.out.println("보고문서 작성자 가져오니?? : " + empCode);
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(empCode);

			//System.out.println("보고양식 코드 못들고오니..? : " + reportDoc.getReportCode());
			ReportVO report = reportDAO.selectReportInfoByEmpcodeForRegistDoc(reportDoc.getReportCode());
			//System.out.println("보고 제목 가져오니??: " + report.getReportTitle());

			reportDoc.setReportDocWriterInfo(emp);
			reportDoc.setReportTitle(report.getReportTitle());

			//System.out.println("매니저 코드가 안들어오니???? : " + report.getReportManager());
			EmployeeVO empManager = employeeService.getEmployeeByEmpCode(report.getReportManager());

			reportDoc.setManagerName(empManager.getEmpName());
			reportDoc.setManagerPosition(empManager.getPositionValue());
			reportDoc.setManagerCharge(empManager.getChargeValue());
			reportDoc.setManagerTeamName(empManager.getTeamValue());
			/*reportDoc.setManagerPosition(empManager.getAttachSavename());*/
			//System.out.println("운영자 직급 가져오니?? : " + empManager.getPositionValue());

		}

		dataMap.put("reportDocList", reportDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}


	@Override
	public Map<String, Integer> getReportDocTotalCountByTeamCode(String teamCode) throws SQLException {
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		int total = reportDAO.selectReportDocTotalCountByTeamCode(teamCode);
		resultMap.put("reportCnt", total);

		return resultMap;
	}


	@Override
	public String getReportDocMarkup(String reportDocCode) throws SQLException {
		String reportMarkup = reportDAO.selectReportDocMarkup(reportDocCode);
		return reportMarkup;
	}

	@Override
	public void modifyReportDoc(ReportDocVO reportDoc) throws SQLException {
		reportDAO.updateReportDocMarkupTemp(reportDoc);

	}

	@Override
	public void modifyReportDocMarkup(ReportDocVO reportDoc) throws SQLException {
		reportDAO.updateReportDocMarkup(reportDoc);
	}


	@Override
	public Map<String, Integer> getReportDocTotalCountForTemp(String empCode) throws SQLException {
		Map<String, Integer> resultMap = new HashMap<String, Integer>();
		int total = reportDAO.selectReportDocTotalCountForTemp(empCode);
		resultMap.put("reportCnt", total);

		return resultMap;
	}



	@Override
	public Map<String, Object> getReportDocListByEmpCodeTemp(ReportCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();

		List<ReportDocVO> reportDocList = reportDAO.selectReportDocListByEmpCodeTemp(cri);
		int totalCount = reportDAO.selectReportDocTotalCountByTeamCode(cri.getLoginEmpCode());
		//System.out.println("보고문서 리스트에 뭐 들어갔니? : " + reportDocList);

		ReportPageMaker pageMaker = new ReportPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		for(ReportDocVO reportDoc : reportDocList) {

			String empCode = reportDoc.getReportDocWriter();
			//System.out.println("보고문서 작성자 가져오니?? : " + empCode);
			EmployeeVO emp = employeeService.getEmployeeByEmpCode(empCode);

			//System.out.println("보고양식 코드 못들고오니..? : " + reportDoc.getReportCode());
			ReportVO report = reportDAO.selectReportInfoByEmpcodeForRegistDoc(reportDoc.getReportCode());
			//System.out.println("보고 제목 가져오니??: " + report.getReportTitle());

			reportDoc.setReportDocWriterInfo(emp);
			reportDoc.setReportTitle(report.getReportTitle());

			//System.out.println("매니저 코드가 안들어오니???? : " + report.getReportManager());
			EmployeeVO empManager = employeeService.getEmployeeByEmpCode(report.getReportManager());

			reportDoc.setManagerName(empManager.getEmpName());
			reportDoc.setManagerPosition(empManager.getPositionValue());
			reportDoc.setManagerCharge(empManager.getChargeValue());
			reportDoc.setManagerTeamName(empManager.getTeamValue());
			/*reportDoc.setManagerPosition(empManager.getAttachSavename());*/
			//System.out.println("운영자 직급 가져오니?? : " + empManager.getPositionValue());

		}

		dataMap.put("reportDocList", reportDocList);
		dataMap.put("pageMaker", pageMaker);

		return dataMap;
	}

	@Override
	public void registerReport(ReportRegisterCommand reportRegisterCommand) throws SQLException {
		String reportCode = reportDAO.selectReportCodeToRegister();
		reportRegisterCommand.setReportCode(reportCode);

		reportDAO.insertReport(reportRegisterCommand);
		if(!reportRegisterCommand.getReportType().equals("I")){
			String reportType = reportRegisterCommand.getReportType();
			List<String> reportDays = reportRegisterCommand.getReportDay();
			for(String reportDay: reportDays) {
				Map<String,String> codeTypeDay = new HashMap<String, String>();
				codeTypeDay.put("reportDay", reportDay);
				codeTypeDay.put("reportCode", reportCode);
				codeTypeDay.put("reportType",reportType);
				reportDAO.insertReportRule(codeTypeDay);
			}
		}

	}

	@Override
	public void modifyReport(ReportRegisterCommand reportRegisterCommand) throws SQLException {
		reportDAO.updateReport(reportRegisterCommand);
		String reportCode = reportRegisterCommand.getReportCode();
		String reportType = reportRegisterCommand.getReportType();

		if(!reportType.equals("I")){
			reportDAO.deleteReportRule(reportCode);

			List<String> reportDays = reportRegisterCommand.getReportDay();
			for(String reportDay: reportDays) {
				Map<String,String> codeTypeDay = new HashMap<String, String>();
				codeTypeDay.put("reportDay", reportDay);
				codeTypeDay.put("reportCode", reportCode);
				codeTypeDay.put("reportType",reportType);
				reportDAO.insertReportRule(codeTypeDay);
			}
		}
	}

}
