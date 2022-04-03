package kr.co.offispace.dto;

import java.util.Date;

public class AnnualVO {
	
	private String annCode;
	private String empCode;
	private int annTotal;
	private int annOccur;
	private int annTotalUsed;
	private int annRemains;
	private int annStandard;
	private Date annYear;
	
	private String annYearSt;
	
	public String getAnnCode() {
		return annCode;
	}
	public void setAnnCode(String annCode) {
		this.annCode = annCode;
	}
	public String getEmpCode() {
		return empCode;
	}
	public void setEmpCode(String empCode) {
		this.empCode = empCode;
	}
	public int getAnnTotal() {
		return annTotal;
	}
	public void setAnnTotal(int annTotal) {
		this.annTotal = annTotal;
	}
	public int getAnnOccur() {
		return annOccur;
	}
	public void setAnnOccur(int annOccur) {
		this.annOccur = annOccur;
	}
	public int getAnnTotalUsed() {
		return annTotalUsed;
	}
	public void setAnnTotalUsed(int annTotalUsed) {
		this.annTotalUsed = annTotalUsed;
	}
	public int getAnnRemains() {
		return annRemains;
	}
	public void setAnnRemains(int annRemains) {
		this.annRemains = annRemains;
	}
	public int getAnnStandard() {
		return annStandard;
	}
	public void setAnnStandard(int annStandard) {
		this.annStandard = annStandard;
	}
	public Date getAnnYear() {
		return annYear;
	}
	public void setAnnYear(Date annYear) {
		this.annYear = annYear;
	}
	
	public String getAnnYearSt() {
		return annYearSt;
	}
	public void setAnnYearSt(String annYearSt) {
		this.annYearSt = annYearSt;
	}
}
