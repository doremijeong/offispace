package kr.co.offispace.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.CriteriaCommand;
import kr.co.offispace.command.ReportCriteria;
import kr.co.offispace.command.ReportCriteriaCommand;
import kr.co.offispace.command.ReportRegisterCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.IrregularReportStakeholersDTO;
import kr.co.offispace.dto.ManagerReportDTO;
import kr.co.offispace.dto.RegularReportStakeholersDTO;
import kr.co.offispace.dto.ReportDocVO;
import kr.co.offispace.dto.ReportVO;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.report.ReportService;
import kr.co.offispace.util.LoggerHelper;


@Controller
@RequestMapping("/report")
public class ReportController {

	@Autowired
	private ReportService reportService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Resource(name="logReportsPath")
	private String savePathReports;


	@RequestMapping("/main")
	public ModelAndView main(ReportCriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "report/main";
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		
		//정기보고서
		List<RegularReportStakeholersDTO> regularReportListToWrite = reportService.getRegularReportListToWrite(loginUser.getEmpCode());

		//최근생성된 보고서
		ReportCriteria cri = criCmd.toCriteria();
		
		cri.setLoginEmpCode(loginUser.getEmpCode());
		cri.setTeamCode(loginUser.getTeamCode());

		Map<String, Object> dataMap = reportService.getReportDocListByTeamCode(cri);
		
		mnv.addObject("regularReportListToWrite",regularReportListToWrite);
		mnv.addObject("dataMap",dataMap);
		mnv.setViewName(url);

		return mnv;
	}

	@RequestMapping("/listForAll")
	public String listForAll() {
		String url = "report/listForAll";

		return url;
	}

	@RequestMapping("/manageReport")
	public ModelAndView reportManage(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "report/manageReport";
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");
		Criteria cri = new Criteria();
		cri.setSearchType("teamCode");
		cri.setKeyword(loginUser.getTeamCode());
		List<ReportVO> reportList = reportService.getReportList(cri);
		
		mnv.addObject("reportList",reportList);
		mnv.setViewName(url);
		
		return mnv;
	}

	
	@RequestMapping("/reportDetail")
	public ModelAndView reportDetail(ModelAndView mnv, HttpSession session, HttpServletRequest request) throws SQLException {
		String url = "report/reportDetail";
		String reportDocCode = request.getParameter("reportDocCode");
		//System.out.println("보고문서코드 가져오니 컨트롤러야아아아 : " + reportDocCode);
		String reportDocMarkup = reportService.getReportDocMarkup(reportDocCode);
;
		ReportDocVO reportDoc = reportService.getReportDocByReportDocCode(reportDocCode);
		
		mnv.addObject("reportDoc",reportDoc);
		mnv.addObject("reportDocCode",reportDocCode);
		mnv.addObject("reportDocMarkup",reportDocMarkup);
		mnv.setViewName(url);
		
		//업무 로그 남기기.
		LoggerHelper.writeReportLog(request, reportDocCode, savePathReports);

		return mnv;
	}



	@RequestMapping("/createReportForm")
	public ModelAndView createReport(ModelAndView mnv, HttpSession session) throws SQLException {
		String url="report/createReportForm";		
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
    	List<EmployeeVO> empList = employeeService.getEmployeeListByTeamCode(emp.getTeamCode());

    	mnv.addObject("empList",empList);
    	mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/writeReport")
	public ModelAndView writeReport(@RequestParam(defaultValue="")String reportCode,
											@RequestParam(defaultValue="menu")String from,
											ModelAndView mnv, HttpSession session) throws SQLException {

		String url = "/report/writeReport";
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");
		System.out.println("from"+from);
		System.out.println("reportCode"+reportCode);
		if(from.equals("main")) {
			Criteria cri = new Criteria();
			cri.setSearchType("reportCode");
			cri.setKeyword(reportCode);

			List<RegularReportStakeholersDTO> report = reportService.getRegularReportList(cri);
			RegularReportStakeholersDTO regularReport = report.get(0);
			mnv.addObject("regularReport", regularReport);
			session.setAttribute("from", from);

		}else {
			String teamCode = emp.getTeamCode();
			//System.out.println("팀코드 나오니: " + teamCode);

			List<IrregularReportStakeholersDTO> irregularReportList = null;
			try {
				irregularReportList = reportService.getIrregularReportList(teamCode);
			} catch (SQLException e) {
				e.printStackTrace();
			}

			session.setAttribute("from", from);
			mnv.addObject("irregularReportList",irregularReportList);
			
			//정기보고서 
			Criteria cri = new Criteria();
			cri.setSearchType("teamCode");
			cri.setKeyword(teamCode);
			List<ReportVO> reportList = reportService.getReportList(cri);
			mnv.addObject("reportList",reportList);
		
		
		}

		mnv.setViewName(url);

		return mnv;
	}


	@RequestMapping("/managerReportList")
	public ModelAndView getManagerReportList(ModelAndView mnv, @RequestParam(defaultValue="present")String searchType, String date, HttpSession session) throws SQLException, ParseException{
		String url = "/report/managerReportList";

		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");

		Map<String, String> searchTypeDateEmpCode = new HashMap<>();

		if("present".equals(searchType)) {
			searchTypeDateEmpCode.put("searchType", "present");

		}else if("past".endsWith(searchType)) {
			searchTypeDateEmpCode.put("searchType", "past");
			searchTypeDateEmpCode.put("lastDay", date);
		}
		searchTypeDateEmpCode.put("empCode",emp.getEmpCode());

		List<ManagerReportDTO>managerReportList = reportService.getManagerReportList(searchTypeDateEmpCode);

		mnv.addObject("managerReportList",managerReportList);
		mnv.setViewName(url);
		return mnv;
	}


	@RequestMapping(value="/managerReportDetail")
	public ModelAndView getManagerReportDetail(String reportCode, String reportDt,
												ModelAndView mnv, HttpSession session) throws SQLException, ParseException{
		String url="/report/managerReportDetail";
		EmployeeVO emp = (EmployeeVO)session.getAttribute("loginUser");

		Map<String, String> reportCodeDtEmpCode = new HashMap<String, String>();
		reportCodeDtEmpCode.put("empCode", emp.getEmpCode());
		reportCodeDtEmpCode.put("reportCode", reportCode);
		reportCodeDtEmpCode.put("reportDt", reportDt);

		ManagerReportDTO managerReport = reportService.getManagerReport(reportCodeDtEmpCode);
		mnv.addObject("managerReport", managerReport);

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping(value="/managerReportDetailShowEmpDoc")
	public ResponseEntity<Map<String, Object>> showEmpDoc (String empCode, String reportCode, String reportDt) {
		ResponseEntity<Map<String, Object>> data = null;
		Map<String,Object> report = new HashMap<>();

		try {
			Map<String,String> empCodeReportCodeReportDt = new HashMap<>();

			empCodeReportCodeReportDt.put("empCode", empCode);
			empCodeReportCodeReportDt.put("reportCode", reportCode);
			empCodeReportCodeReportDt.put("reportDt", reportDt);
			ReportDocVO reportDoc = reportService.getReportFromManager(empCodeReportCodeReportDt);

			report.put("reportDoc", reportDoc);
			data = new ResponseEntity<Map<String, Object>>(report,HttpStatus.OK);

		} catch (SQLException e) {
			e.printStackTrace();
			data = new ResponseEntity<Map<String, Object>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		return data;
	}
	



	@RequestMapping("/myReport/list")
	public ModelAndView reportDocListByEmpCode(CriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws Exception {

		String url = "report/myReportList";

		Criteria cri = criCmd.toCriteria();

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		cri.setLoginEmpCode(emp.getEmpCode());
		cri.setPerPageNum(19);

		Map<String, Object> dataMap = reportService.getReportDocListByEmpCode(cri);
		Map<String, Integer> reportDocCntMap = reportService.getReportDocTotalCountByEmpCode(emp.getEmpCode());

		mnv.addObject("dataMap", dataMap);
		mnv.addObject("reportDocMap", reportDocCntMap);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping("/teamReport/list")
	public ModelAndView reportDocListByTeamCode(ReportCriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws Exception {

		String url = "report/teamReportList";

		ReportCriteria cri = criCmd.toCriteria();

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");


		cri.setLoginEmpCode(emp.getEmpCode());
		cri.setTeamCode(emp.getTeamCode());

		Map<String, Object> dataMap = reportService.getReportDocListByTeamCode(cri);
		Map<String, Integer> reportDocCntMap = reportService.getReportDocTotalCountByTeamCode(emp.getTeamCode());

		mnv.addObject("dataMap", dataMap);
		mnv.addObject("reportDocMap", reportDocCntMap);
		mnv.setViewName(url);

		return mnv;

	}

	@RequestMapping("/tempReport/list")
	public ModelAndView reportDocListByTemp(ReportCriteriaCommand criCmd, ModelAndView mnv, HttpSession session) throws Exception {

		String url = "report/tempReportList";

		ReportCriteria cri = criCmd.toCriteria();

		EmployeeVO emp = (EmployeeVO) session.getAttribute("loginUser");

		cri.setLoginEmpCode(emp.getEmpCode());

		Map<String, Object> dataMap = reportService.getReportDocListByEmpCodeTemp(cri);
		Map<String, Integer> reportDocCntMap = reportService.getReportDocTotalCountForTemp(emp.getEmpCode());

		mnv.addObject("dataMap", dataMap);
		mnv.addObject("reportDocMap", reportDocCntMap);
		mnv.setViewName(url);

		return mnv;
	}


	@RequestMapping("/modifyReportShow")
	public ModelAndView modifyReport(@RequestParam(defaultValue="")String reportDocCode,
									 ModelAndView mnv) throws Exception {

		String url = "report/modifyReport";

		String reportDocMarkup = reportService.getReportDocMarkup(reportDocCode);

		mnv.addObject("reportDocMarkup", reportDocMarkup);
		mnv.addObject("reportDocCode", reportDocCode);
		mnv.setViewName(url);

		return mnv;

	}

}
