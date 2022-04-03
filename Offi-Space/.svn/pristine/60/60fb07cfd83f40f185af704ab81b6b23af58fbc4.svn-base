package kr.co.offispace.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import kr.co.offispace.dto.EmployeeVO;

@ControllerAdvice
public class ExceptionControllerAdvisor {

	//slf4j
	private static final Logger logger = LoggerFactory.getLogger(ExceptionControllerAdvisor.class);

	@ExceptionHandler(SQLException.class)
	public String sqlExceptionPage(Exception e,Model model,HttpSession session)
	{
		String url="error/sqlException";

		logger.error(e.toString());

		EmployeeVO loginUser = (EmployeeVO)session.getAttribute("loginUser");

		model.addAttribute("exception",e);
		model.addAttribute("user",loginUser!=null? loginUser.getEmpName()+"님":"");

		return url;
	}
	
	@ExceptionHandler(Exception.class)
	public String exceptionPage(Exception e)
	{
		String url="error/exception";
		
		e.printStackTrace();
		
		return url;
	}
}
