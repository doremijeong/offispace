package kr.co.offispace.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


import kr.co.offispace.dto.EmployeeVO;

public class User implements UserDetails {

	private EmployeeVO employee;
	
	public User(EmployeeVO employee) {
		this.employee = employee;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
		roles.add(new SimpleGrantedAuthority(employee.getStatusCode()));
		return roles;
	}

	@Override
	public String getPassword() {
		return employee.getEmpPassword();
	}

	@Override
	public String getUsername() {
		return employee.getEmpId();
	}

	@Override
	public boolean isAccountNonLocked() { //사용 정지 혹은 휴먼계정  : enabled = 3
		
		boolean result = true;
		
		if((employee.getStatusCode()).equals("S102")) {
			result = false;
		}
		
		return result;
	}


	@Override
	public boolean isEnabled() { // 탈퇴 혹은 삭제 : enabled = 0
		boolean result = true;
		
		if((employee.getStatusCode()).equals("S103")) {
			result = false;
		}
		
		return result;
	}

	public EmployeeVO getMemberVO() {
		return this.employee;
	}

	@Override
	public boolean isAccountNonExpired() { // 기간제 만료여부
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() { // 인증정보 만료여부
		// TODO Auto-generated method stub
		return true;
	}
	
	
}
