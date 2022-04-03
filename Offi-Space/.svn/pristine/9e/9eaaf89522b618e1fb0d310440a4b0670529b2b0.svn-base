package kr.co.offispace.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.josephoconnell.html.HTMLInputFilter;

public class XSSRequestInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		Enumeration<String> crossParamName = request.getParameterNames();
		
		while(crossParamName.hasMoreElements()) {
			String paramName = crossParamName.nextElement();
			String paramValue = request.getParameter(paramName);
			
			request.setAttribute("XSS" + paramName, HTMLInputFilter.htmlSpecialChars(paramValue));
		}
		
		return true;
		
	}
	
	
	
}
