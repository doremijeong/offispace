package kr.co.offispace.security;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.co.offispace.dto.AttendVO;
import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.service.attend.AttendService;
import kr.co.offispace.service.employee.EmployeeService;
import kr.co.offispace.util.LoggerHelper;

public class LoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler{

//	@Resource(name="logLoginsPath")
//	private String savePathLogins;
	
	private EmployeeService employeeService;
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	private AttendService attendService;
	public void setAttendService(AttendService attendService){
		this.attendService = attendService;
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		UserDetails userDetail = (UserDetails)authentication.getDetails();
		String id = userDetail.getUsername();
		EmployeeVO loginUser = null;
		
		try {
			loginUser = employeeService.getEmployee(id);
		} catch (Exception e) {
			e.printStackTrace();
			//로그파일 생성할때 쓰기~!
			/*ExceptionLoggerHelper.write(request, e, memberService);*/
			//response.getWriter() 메세지 전송(script)
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		session.setMaxInactiveInterval(60*60); //60분.
		
		//출퇴근 버튼 로그아웃해도 유지도되도록 세션에 심어주는 부분.
		AttendVO attend=new AttendVO();
		attend.setEmpCode(loginUser.getEmpCode());
		LocalDate ld = LocalDate.now(); // 목적 : 오늘 날짜만 ! 시간은 00:00:00 (출근날짜)
		Date todayOnlyDate = java.sql.Date.valueOf(ld);
		attend.setAttDt(todayOnlyDate);
		
		AttendVO loginAttend=null;

		try {
			loginAttend=attendService.getAttendForLogin(attend);
			
			if(loginAttend!=null)
			{
				//String값 세팅................
				SimpleDateFormat format1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				
				if(loginAttend.getAttDt()!=null) loginAttend.setAttDtSt(format1.format(loginAttend.getAttDt()));
				if(loginAttend.getAttTime()!=null) loginAttend.setAttTimeSt(format1.format(loginAttend.getAttTime()));
				
				if(loginAttend.getAttLeavTime()!=null) loginAttend.setAttLeavTimeSt(format1.format(loginAttend.getAttLeavTime()));
				if(loginAttend.getAttRealWorkTime()!=null) loginAttend.setAttRealWorkTimeSt(format1.format(loginAttend.getAttRealWorkTime()));
				if(loginAttend.getAttTotalWorkTime()!=null) loginAttend.setAttTotalWorkTimeSt(format1.format(loginAttend.getAttTotalWorkTime()));
				
				session.setAttribute("attend", loginAttend);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		//로그인 로그 남기기
		LoggerHelper.writeLoginLog(request,"c:/offispace/log/logins/");
		
		super.onAuthenticationSuccess(request, response, authentication);
	}

	
	
	
}
