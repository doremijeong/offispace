package kr.co.offispace.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.offispace.command.Criteria;
import kr.co.offispace.command.ReportRegisterCommand;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.dto.ReportDocVO;
import kr.co.offispace.dto.ReportVO;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.service.report.ReportService;

@RestController
@RequestMapping("/report")
public class ReportRestController {

	@Autowired
	private ReportService reportService;

	@Autowired
	private EmployeeService employeeService;

	@ResponseBody
	@RequestMapping("/showReportForm")
	public ResponseEntity<Map<String, Object>> showReportForm(String reportCode) throws SQLException {

		ResponseEntity<Map<String, Object>> result = null;
		Map<String, Object> report = new HashMap<String, Object>();


		String reportMarkup = reportService.getReportMarkup(reportCode);

		report.put("reportMarkup", reportMarkup);

		result = new ResponseEntity<Map<String, Object>>(report, HttpStatus.OK);


		return result;

	}

	@ResponseBody
	@RequestMapping("/getReport")
	public ResponseEntity<Map<String, Object>> showReportForm(Criteria cri) throws SQLException {

		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> data = new HashMap<String, Object>();

		ReportVO report = reportService.getReport(cri);

		data.put("report", report);
		entity = new ResponseEntity<Map<String, Object>>(data, HttpStatus.OK);

		return entity;
	}

	@ResponseBody
	@RequestMapping("/registerReport")
	public ResponseEntity<String> registerReport( @RequestBody ReportRegisterCommand reportRegisterCommand,HttpSession session) throws Exception{
		ResponseEntity<String> entity  = new ResponseEntity<String>(HttpStatus.OK);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		reportRegisterCommand.setReportManager(loginUser.getEmpCode());
		reportRegisterCommand.setReportTeamCode(loginUser.getTeamCode());

		reportService.registerReport(reportRegisterCommand);

		return entity;
	}

	@ResponseBody
	@RequestMapping("/modifyReportFromManage")
	public ResponseEntity<String> modifyReport( @RequestBody  ReportRegisterCommand reportRegisterCommand,HttpSession session) throws Exception{
		ResponseEntity<String> entity  = new ResponseEntity<String>(HttpStatus.OK);
		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		reportRegisterCommand.setReportManager(loginUser.getEmpCode());
		reportRegisterCommand.setReportTeamCode(loginUser.getTeamCode());

		System.out.println(reportRegisterCommand);

		reportService.modifyReport(reportRegisterCommand);

		return entity;
	}

	@ResponseBody
	@RequestMapping(value="/registReportDoc", method=RequestMethod.POST)
	public ResponseEntity<String> registReportDoc(@RequestBody ReportDocVO reportDocVO,HttpServletRequest request, HttpSession session) throws Exception{

		ResponseEntity<String> entity = new ResponseEntity<String>("식식...",HttpStatus.OK);

		EmployeeVO empCode = (EmployeeVO) session.getAttribute("loginUser");
		EmployeeVO emp = employeeService.getEmployeeByEmpCode(empCode.getEmpCode());

		ReportVO report = reportService.getReportInfoForRegistDoc(reportDocVO.getReportCode());

		String param = request.getParameter("param");

		reportDocVO.setReportDocWriterInfo(employeeService.getEmployeeByEmpCode(emp.getEmpCode()));
		reportDocVO.setReportDocWriter(emp.getEmpCode());
		reportDocVO.setReportDocTeamCode(emp.getTeamCode());
		reportDocVO.setReportType(report.getReportType());
		reportDocVO.setJobCode(report.getJobCode());
		reportDocVO.setReportOpen(report.getReportOpen());
		reportDocVO.setReportTitle(report.getReportTitle());
		reportDocVO.setManagerEmpCode(report.getReportManager());

		if(param.equals("report")) {
			reportDocVO.setReportDocTemp("N");
		}else {
			reportDocVO.setReportDocTemp("Y");
		}

		reportService.registerReportDoc(reportDocVO);

		return entity;
	}


	@ResponseBody
	@RequestMapping(value="/modifyReport", method=RequestMethod.POST)
	public ResponseEntity<String> modifyReport(@RequestBody ReportDocVO reportDoc, HttpServletRequest request, HttpSession session) throws Exception{

		ResponseEntity<String> entity = new ResponseEntity<String>("식식...",HttpStatus.OK);

		String param = request.getParameter("param");
		//System.out.println("파라미터 들어오니이~!?" + param);
		//System.out.println("보고문서 코드 잘 들어오니????? : " + reportDoc.getReportDocCode());

		if(param.equals("report")) {
			reportDoc.setReportDocTemp("N");
			reportService.modifyReportDoc(reportDoc);
		}else {
			reportDoc.setReportDocTemp("Y");
			reportService.modifyReportDoc(reportDoc);
		}

		return entity;
	}

	@ResponseBody
	@RequestMapping(value="/updateRegularReport",method=RequestMethod.POST)
	public ResponseEntity<String> updateRegularReport(@RequestBody ReportDocVO reportDoc){
			ResponseEntity<String> entity = null;
		try {
			reportService.modifyReportDocMarkup(reportDoc);
			entity = new ResponseEntity<String>(HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		return entity;
	}
}
