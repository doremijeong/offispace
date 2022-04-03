package kr.co.offispace.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.offispace.command.ContactCriteria;
import kr.co.offispace.command.ContactCriteriaCommand;
import kr.co.offispace.service.employee.EmployeeService;

@Controller
@RequestMapping("/contact")
public class ContactController {

	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/list")
	public ModelAndView main(ContactCriteriaCommand cri2, HttpServletRequest request, ModelAndView mnv) throws Exception
	{
		String url="contact/main";
		
		ContactCriteria cri = cri2.toContactCriteria();
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(cri+"criccricricricricricir@@@@@@@@@@");
		System.out.println(cri.getKeyword());
		System.out.println(cri.getPage());
		System.out.println(cri.getPerPageNum());
		System.out.println(cri.getSearchType());
		System.out.println(cri.getStartRowNum());
		System.out.println("@@@@@@@@@@@@@@@@@@@@@");
		
		Map<String, Object> dataMap = employeeService.getEmployeeListPage(cri);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
