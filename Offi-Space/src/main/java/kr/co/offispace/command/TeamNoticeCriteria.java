package kr.co.offispace.command;

public class TeamNoticeCriteria {
	
	private int page = 1;
	private int perPageNum = 10;
	private int startRowNum = 0;
	
	private String searchType="";
	private String keyword="";
	
	private String loginEmpCode;
	private String teamCode;
	
	public String getLoginEmpCode() {
		return loginEmpCode;
	}

	public void setLoginEmpCode(String loginEmpCode) {
		this.loginEmpCode = loginEmpCode;
	}

	public TeamNoticeCriteria() {}
	
	public TeamNoticeCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}
	public TeamNoticeCriteria(int page, int perPageNum, String searchType, String keyword) {
		this.page = page;
		this.perPageNum = perPageNum;
		this.keyword = keyword;
		this.searchType = searchType;
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

	private void setStartRowNum() {
		this.startRowNum=(this.page-1)*perPageNum;		
	}

	public String getTeamCode() {
		return teamCode;
	}

	public void setTeamCode(String teamCode) {
		this.teamCode = teamCode;
	}

	
	@Override
	public String toString() {
		return "TeamNoticeCriteria [page=" + page + ", perPageNum=" + perPageNum + ", startRowNum=" + startRowNum
				+ ", searchType=" + searchType + ", keyword=" + keyword + ", loginEmpCode=" + loginEmpCode
				+ ", teamCode=" + teamCode + "]";
	}

	
}
