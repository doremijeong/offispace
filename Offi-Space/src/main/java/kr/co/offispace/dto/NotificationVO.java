package kr.co.offispace.dto;

import java.util.Date;

public class NotificationVO {

	private String  ntCode; // 해당알림항목의 PK값
	private String  ntFromEmpCode; //알림 수신자
	private String  ntLinkPath; //해당 알림의 상세 페이지 경로
	private String  ntNew="Y";
	private String  empCode; // 알림 송신자
	private String  ntConfirm="N";
	private Date    ntDt; // SYSDATE로 hardCoding 되어있다.
	private String  ntMsg="알림이 도착했습니다.";
	private String  ntIcon="far fa-bell";
	private Integer ntMsec=10000;
	private String  ntTitle="새로운 알림";
	private String  ntImportant="N";

	private EmployeeVO ntFrom;

	public NotificationVO() {};

	public NotificationVO(String ntCode, String ntFromEmpCode, String ntLinkPath, String empCode, String ntMsg,
			String ntIcon, String ntTitle) {
		this.ntCode = ntCode;
		this.ntFromEmpCode = ntFromEmpCode;
		this.ntLinkPath = ntLinkPath;
		this.empCode = empCode;
		this.ntMsg = ntMsg;
		this.ntIcon = ntIcon;
		this.ntTitle = ntTitle;

	}



	public NotificationVO(String ntCode, String ntFromEmpCode, String ntLinkPath, String empCode, String ntMsg,
			String ntIcon, Integer ntMsec, String ntTitle, String ntImportant) {
		this.ntCode = ntCode;
		this.ntFromEmpCode = ntFromEmpCode;
		this.ntLinkPath = ntLinkPath;
		this.empCode = empCode;
		this.ntMsg = ntMsg;
		this.ntIcon = ntIcon;
		this.ntMsec = ntMsec;
		this.ntTitle = ntTitle;
		this.ntImportant = ntImportant;

	}

	public String getNtCode() {
		return ntCode;
	}
	public void setNtCode(String ntCode) {
		this.ntCode = ntCode;
	}
	public String getNtFromEmpCode() {
		return ntFromEmpCode;
	}
	public void setNtFromEmpCode(String ntFromEmpCode) {
		this.ntFromEmpCode = ntFromEmpCode;
	}
	public String getNtLinkPath() {
		return ntLinkPath;
	}
	public void setNtLinkPath(String ntLinkPath) {
		this.ntLinkPath = ntLinkPath;
	}
	public String getNtNew() {
		return ntNew;
	}
	public void setNtNew(String ntNew) {
		this.ntNew = ntNew;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getNtConfirm() {
		return ntConfirm;
	}
	public void setNtConfirm(String ntConfirm) {
		this.ntConfirm = ntConfirm;
	}
	public Date getNtDt() {
		return ntDt;
	}
	public void setNtDt(Date ntDt) {
		this.ntDt = ntDt;
	}
	public String getNtMsg() {
		return ntMsg;
	}
	public void setNtMsg(String ntMsg) {
		this.ntMsg = ntMsg;
	}
	public String getNtIcon() {
		return ntIcon;
	}
	public void setNtIcon(String ntIcon) {
		this.ntIcon = ntIcon;
	}
	public Integer getNtMsec() {
		return ntMsec;
	}
	public void setNtMsec(Integer ntMsec) {
		this.ntMsec = ntMsec;
	}
	public String getNtTitle() {
		return ntTitle;
	}
	public void setNtTitle(String ntTitle) {
		this.ntTitle = ntTitle;
	}
	public String getNtImportant() {
		return ntImportant;
	}
	public void setNtImportant(String ntImportant) {
		this.ntImportant = ntImportant;
	}

	public EmployeeVO getNtFrom() {
		return ntFrom;
	}
	public void setNtFrom(EmployeeVO ntFrom) {
		this.ntFrom = ntFrom;
	}





}