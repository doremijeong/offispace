package kr.co.offispace.dto;

public class ApprovalCertifyVO {
	private String empCode;
	private String apvCertify; // 인증방식
	private String apvStamp; // 승인 도장 파일 경로
	
	private String otpKey; // OTP인증키
	
	private String apvPassword; // 결재 비밀번호

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getApvCertify() {
		return apvCertify;
	}

	public void setApvCertify(String apvCertify) {
		this.apvCertify = apvCertify;
	}

	public String getApvStamp() {
		return apvStamp;
	}

	public void setApvStamp(String apvStamp) {
		this.apvStamp = apvStamp;
	}

	public String getOtpKey() {
		return otpKey;
	}

	public void setOtpKey(String otpKey) {
		this.otpKey = otpKey;
	}

	public String getApvPassword() {
		return apvPassword;
	}

	public void setApvPassword(String apvPassword) {
		this.apvPassword = apvPassword;
	}
	
	
}
