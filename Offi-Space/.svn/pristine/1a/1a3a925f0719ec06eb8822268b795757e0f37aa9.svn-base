package kr.co.offispace.command;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import kr.co.offispace.dto.ApvAgencyVO;

public class ApvAgencyVOCommand {
	private String empCode;
	private String agenReason;
	private String giveEmpCode;
	private String agenStartDt;
	private String agenEndDt;
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public String getAgenReason() {
		return agenReason;
	}
	public void setAgenReason(String agenReason) {
		this.agenReason = agenReason;
	}
	public String getGiveEmpCode() {
		return giveEmpCode;
	}
	public void setGiveEmpCode(String giveEmpCode) {
		this.giveEmpCode = giveEmpCode;
	}
	public String getAgenStartDt() {
		return agenStartDt;
	}
	public void setAgenStartDt(String agenStartDt) {
		this.agenStartDt = agenStartDt;
	}
	public String getAgenEndDt() {
		return agenEndDt;
	}
	public void setAgenEndDt(String agenEndDt) {
		this.agenEndDt = agenEndDt;
	}

	public ApvAgencyVO toApvAgencyVO() throws Exception {
		ApvAgencyVO agency = new ApvAgencyVO();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date agenEndDt = sdf.parse(this.agenEndDt);
		agency.setAgenEndDt(agenEndDt);

		Date agenStartDt = sdf.parse(this.agenStartDt);
		agency.setAgenStartDt(agenStartDt);

		agency.setAgenReason(this.agenReason);
		agency.setEmpCode(this.empCode);
		agency.setGiveEmpCode(this.giveEmpCode);

		return agency;
	}
}
