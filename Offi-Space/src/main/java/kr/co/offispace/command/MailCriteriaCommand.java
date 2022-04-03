package kr.co.offispace.command;

public class MailCriteriaCommand {

	private String page;
    private String perPageNum;
    private String searchType;
    private String keyword;
    private String kindOfMail;
    private String loginUser;

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
	public String getLoginUser() {
		return loginUser;
	}
	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(String perPageNum) {
		this.perPageNum = perPageNum;
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

    public String getKindOfMail() {
		return kindOfMail;
	}
	public void setKindOfMail(String kindOfMail) {
		this.kindOfMail = kindOfMail;
	}
	public MailCriteria toMailCriteria() {
    	MailCriteria cri = new MailCriteria();

    	if(page != null && !page.isEmpty()) {
    		cri.setPage(Integer.parseInt(page));
    	}

    	if(perPageNum != null && !perPageNum.isEmpty()) {
    		cri.setPerPageNum(Integer.parseInt(perPageNum));
    	}
    	if(loginUser != null && !loginUser.isEmpty()) {
    		cri.setLoginUser(this.loginUser);
    	}

    	cri.setKeyword(keyword);
    	cri.setSearchType(searchType);
    	cri.setKindOfMail(kindOfMail);

    	cri.setTo(this.to);
    	cri.setFrom(this.from);
    	cri.setsDate(this.sDate);
    	cri.seteDate(this.eDate);

    	return cri;
    }
}
