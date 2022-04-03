package kr.co.offispace.security;

import java.text.SimpleDateFormat;

import org.apache.commons.codec.digest.Sha2Crypt;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

import kr.co.offispace.dto.EmployeeVO;
import kr.co.offispace.service.employee.EmployeeService;

public class CustomAuthenticationProvider implements AuthenticationProvider{

	private EmployeeService employeeService;
	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	
	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		String login_id = (String)auth.getPrincipal();
		String login_pwd = (String)auth.getCredentials();
		
		EmployeeVO employee = null;
		
		if(login_id.equals("") || login_pwd.equals("")) {
			
			throw new BadCredentialsException("아이디와 비밀번호를 모두 입력해주세요.");
			
		}else {
			
			try {
				employee = employeeService.getEmployee(login_id);
			} catch (Exception e) {
				e.printStackTrace();
				throw new BadCredentialsException("존재하지 않는 아이디입니다.");
			}
			
		}
		
		
		if(employee != null) {
			if(login_pwd.equals(employee.getEmpPassword())) { //아이디 패스워드 일치
				
				/*최초로그인 체크*/
				SimpleDateFormat dtfmt = new SimpleDateFormat("yyyyMMdd");
				
				String firstId = "EMP"+dtfmt.format(employee.getEmpHireDt())+employee.getEmpCode().substring(2);
				String firstPwd = employee.getEmpCode() + employee.getEmpReginum().substring(0,6);
				
				if((login_id.equals(firstId)) && login_pwd.equals(firstPwd)) {
					throw new BadCredentialsException(employee.getEmpCode() + "최초로그인입니다. 개인정보 설정을 시작합니다!");
				}
				
				
				UserDetails authUser = new User(employee);
				boolean invalidCheck = authUser.isAccountNonLocked()
									&& authUser.isEnabled();
				
				//System.out.println("상태코드 로그인 : " + invalidCheck);
				
				if(invalidCheck) {
					//스트링 시큐리티 내부 클래스로 인증 토큰 생성한다.
					//auth.getPrincipal() : id
					//auth.getCredentials() : pwd
					UsernamePasswordAuthenticationToken result =
							new UsernamePasswordAuthenticationToken(authUser.getUsername(),
																	authUser.getPassword(),
																	authUser.getAuthorities());
					
					//전달할 내용을 설정한 후
					result.setDetails(authUser);
					//리턴한다.successHandler로 전송된다.
					return result;
				}
				
				throw new BadCredentialsException("휴직/퇴직자는 로그인이 불가합니다.");
			}else {
				throw new BadCredentialsException("패스워드가 일치하지 않습니다.");
			}
		} else {
			throw new BadCredentialsException("존재하지 않는 아이디 입니다.");
		}
		
		
	}

	@Override
	public boolean supports(Class<?> auth) {
		return auth.equals(UsernamePasswordAuthenticationToken.class);
	}

}
