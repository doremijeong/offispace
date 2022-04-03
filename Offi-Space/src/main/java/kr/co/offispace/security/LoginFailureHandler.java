package kr.co.offispace.security;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

public class LoginFailureHandler extends SimpleUrlAuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {

		String orMsg = exception.getMessage();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		//확인용
		int firstLoginIndex = orMsg.indexOf("최");


		if(firstLoginIndex == 6) {

			String empCode = orMsg.substring(0, (orMsg.indexOf("최")));
			String msg = orMsg.substring(orMsg.indexOf("최"));

			//out.println("<script src='"+request.getContextPath()+"/resources/js/common.js'></script>");
			out.println("<script>");
			out.println("alert('" + msg + "');");
			out.println("if('" + msg + "' == '최초로그인입니다. 개인정보 설정을 시작합니다!'){");
			out.println("window.open('"+request.getContextPath()+"/common/initLogin.do?empCode=" + empCode + "','','width = 700, height = 540','_blank');");
			out.println("}");
			out.println("history.go(-1);");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('" + orMsg + "');");
			out.println("history.go(-1);");
			out.println("</script>");
		}

	}




}
