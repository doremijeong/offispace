package kr.co.offispace.command;

public class MailCriteria {

	private int page = 1;
	private int perPageNum = 20;
	private int startRowNum = 0;

	private String searchType="";
	private String keyword="";

	private String kindOfMail; // 어느 메일의 리스트를 조회하는 지 구분해 주는 애
	private String loginUser; // 메일을 조회하는 사람

	private String to;
	private String from;
	private String sDate;
	private String eDate;

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}

	public String getsDate() {
		return sDate;
	}

	public void setsDate(String sDate) {
		this.sDate = sDate;
	}

	public String geteDate() {
		return eDate;
	}

	public void seteDate(String eDate) {
		this.eDate = eDate;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public MailCriteria() {}

	public MailCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}

	public MailCriteria(String page, String perPageNum) {
			this.page = Integer.parseInt(page);
			this.perPageNum = Integer.parseInt(perPageNum);
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

	public String getKindOfMail() {
		return kindOfMail;
	}

	public void setKindOfMail(String kindOfMail) {
		this.kindOfMail = kindOfMail;
	}

	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	public Criteria toCriteria() {

		Criteria cri = new Criteria();
		cri.setPage(this.page);
		cri.setPerPageNum(this.perPageNum);
		cri.setKeyword(this.keyword);
		cri.setSearchType(this.searchType);

		return cri;
	}
}
