package kr.co.offispace.dto;

public class ReportDocVO {

	private String reportDocCode;		//보고문서 코드
	private String reportDocMarkup;		//보고문서 마크업
	private String reportDocDt;			//보고문서 등록일
	private String reportDocWriter;		//보고문서 작성자
	private String reportType;			//보고문서 타입
	private String reportCode;			//보고 코드
	private String reportDocTeamCode;	//보고문서 부서코드
	private String jobCode;				//보고문서 업무코드
	private String reportOpen;			//보고문서 공개여부
	private String reportDocTitle;		//보고문서 제목
	private String reportDocTemp;		//보고문서 임시저장 여부

	private EmployeeVO reportDocWriterInfo;	//보고문서 작성자 정보
	private EmployeeVO reportDocManagerInfo; 
	private String reportTitle; 		//보고문서 유형

	private String managerEmpCode;       //운영자 코드
	private String managerName;			//운영자 이름
	private String managerPosition;		//운영자 직급
	private String managerCharge;		//운영자 직책
	private String managerTeamName;		//운영자 부서이름
	private String mamagerPicture;		//운영자 사진


	public String getReportDocCode() {
		return reportDocCode;
	}
	public void setReportDocCode(String reportDocCode) {
		this.reportDocCode = reportDocCode;
	}
	public String getReportDocMarkup() {
		return reportDocMarkup;
	}
	public void setReportDocMarkup(String reportDocMarkup) {
		this.reportDocMarkup = reportDocMarkup;
	}
	public String getReportDocDt() {
		return reportDocDt;
	}
	public void setReportDocDt(String reportDocDt) {
		this.reportDocDt = reportDocDt;
	}
	public String getReportDocWriter() {
		return reportDocWriter;
	}
	public void setReportDocWriter(String reportDocWriter) {
		this.reportDocWriter = reportDocWriter;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportDocType) {
		this.reportType = reportDocType;
	}
	public String getReportCode() {
		return reportCode;
	}
	public void setReportCode(String reportCode) {
		this.reportCode = reportCode;
	}
	public String getReportDocTeamCode() {
		return reportDocTeamCode;
	}
	public void setReportDocTeamCode(String reportDocTeamCode) {
		this.reportDocTeamCode = reportDocTeamCode;
	}
	public String getJobCode() {
		return jobCode;
	}
	public void setJobCode(String jobCode) {
		this.jobCode = jobCode;
	}

	public EmployeeVO getReportDocWriterInfo() {
		return reportDocWriterInfo;
	}
	public void setReportDocWriterInfo(EmployeeVO reportDocWriterInfo) {
		this.reportDocWriterInfo = reportDocWriterInfo;
	}
	public String getReportDocTitle() {
		return reportDocTitle;
	}
	public void setReportDocTitle(String reporDoctTitle) {
		this.reportDocTitle = reporDoctTitle;
	}
	public String getReportOpen() {
		return reportOpen;
	}
	public void setReportOpen(String reportOpen) {
		this.reportOpen = reportOpen;
	}
	public String getReportTitle() {
		return reportTitle;
	}
	public void setReportTitle(String reportTitle) {
		this.reportTitle = reportTitle;
	}

	public String getManagerEmpCode() {
		return managerEmpCode;
	}
	public void setManagerEmpCode(String managerEmpCode) {
		this.managerEmpCode = managerEmpCode;
	}
	public String getManagerName() {
		return managerName;
	}
	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}
	public String getManagerPosition() {
		return managerPosition;
	}
	public void setManagerPosition(String managerPosition) {
		this.managerPosition = managerPosition;
	}
	public String getManagerCharge() {
		return managerCharge;
	}
	public void setManagerCharge(String managerCharge) {
		this.managerCharge = managerCharge;
	}
	public String getManagerTeamName() {
		return managerTeamName;
	}
	public void setManagerTeamName(String managerTeamName) {
		this.managerTeamName = managerTeamName;
	}
	public String getMamagerPicture() {
		return mamagerPicture;
	}
	public void setMamagerPicture(String mamagerPicture) {
		this.mamagerPicture = mamagerPicture;
	}
	public String getReportDocTemp() {
		return reportDocTemp;
	}
	public void setReportDocTemp(String reportDocTemp) {
		this.reportDocTemp = reportDocTemp;
	}
	public EmployeeVO getReportDocManagerInfo() {
		return reportDocManagerInfo;
	}
	public void setReportDocManagerInfo(EmployeeVO reportDocManagerInfo) {
		this.reportDocManagerInfo = reportDocManagerInfo;
	}
	


}
