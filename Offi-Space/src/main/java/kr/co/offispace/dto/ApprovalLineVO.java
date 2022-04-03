package kr.co.offispace.dto;

public class ApprovalLineVO {
	private String apvLineCode;
	private String empCode;
	private String apvConfirm;
	private String apvConfirmDt;
	private String apvCode;
	private String apvKindCode;
	private int apvLineOrder;

	private EmployeeVO lineEmp; // 결재선에 있는 사원 VO

	public EmployeeVO getLineEmp() {
		return lineEmp;
	}

	public void setLineEmp(EmployeeVO lineEmp) {
		this.lineEmp = lineEmp;
	}

	public String getApvLineCode() {
		return apvLineCode;
	}

	public void setApvLineCode(String apvLineCode) {
		this.apvLineCode = apvLineCode;
	}

	public String getEmpCode() {
		return empCode;
	}

	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}

	public String getApvConfirm() {
		return apvConfirm;
	}

	public void setApvConfirm(String apvConfirm) {
		this.apvConfirm = apvConfirm;
	}

	public String getApvConfirmDt() {
		return apvConfirmDt;
	}

	public void setApvConfirmDt(String apvConfirmDt) {
		this.apvConfirmDt = apvConfirmDt;
	}

	public String getApvCode() {
		return apvCode;
	}

	public void setApvCode(String apvCode) {
		this.apvCode = apvCode;
	}

	public String getApvKindCode() {
		return apvKindCode;
	}

	public void setApvKindCode(String apvKindCode) {
		this.apvKindCode = apvKindCode;
	}

	public int getApvLineOrder() {
		return apvLineOrder;
	}

	public void setApvLineOrder(int apvLineOrder) {
		this.apvLineOrder = apvLineOrder;
	}

}
