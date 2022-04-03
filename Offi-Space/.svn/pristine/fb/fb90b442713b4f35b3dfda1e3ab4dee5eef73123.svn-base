package kr.co.offispace.command;

public class JobKeywordSearchCriteria {


	private int page = 1;
	private int perPageNum = 15;
	private int startRowNum = 0;

	private String searchType="";
	private String keyword="";
    
	private String notDone="N";

	private String loginEmpCode="";
	private String jobStatus="";

	private String teamCode="";

	public JobKeywordSearchCriteria() {}

	public JobKeywordSearchCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}
	public JobKeywordSearchCriteria(int page, int perPageNum, String searchType, String keyword, String loginEmpCode, String jobStatus, String teamCode ) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
		this.searchType = searchType;
		this.loginEmpCode = loginEmpCode;
		this.jobStatus = jobStatus;
		this.teamCode = teamCode;

		setStartRowNum();
	}

	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<1) {
			this.page=1;
		}else {
			this.page = page;
		}
		setStartRowNum();
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum < 1) {
			this.perPageNum = 10;
		}else {
			this.perPageNum = perPageNum;
		}
		setStartRowNum();
	}

	public int getStartRowNum() {
		return this.startRowNum;
	}
	private void setStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;
	}

	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getLoginEmpCode() {
		return loginEmpCode;
	}
	public void setLoginEmpCode(String loginEmpCode) {
		this.loginEmpCode = loginEmpCode;
	}

	public String getJobStatus() {
		return jobStatus;
	}
	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getNotDone() {
		return notDone;
	}

	public void setNotDone(String notDone) {
		this.notDone = notDone;
	}
	
	public String getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	@Override
	public String toString() {
		return "JobKeywordSearchCriteria [page=" + page + ", perPageNum=" + perPageNum + ", startRowNum=" + startRowNum
				+ ", searchType=" + searchType + ", keyword=" + keyword + ", notDone=" + notDone + ", loginEmpCode="
				+ loginEmpCode + ", jobStatus=" + jobStatus + ", teamCode=" + teamCode + "]";
	}







}
