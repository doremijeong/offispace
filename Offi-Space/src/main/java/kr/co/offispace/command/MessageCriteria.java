package kr.co.offispace.command;

public class MessageCriteria {
	
	private int page = 1;
	private int perPageNum = 15;
	private int startRowNum = 0;
	
	private String searchType="";
	private String keyword="";
	
	private String kindOfMsg; // 어느 쪽지의 리스트를 조회하는 지 구분
	private String loginUser; // 쪽지를 조회하는 사람
	
	public MessageCriteria() {}
	
	public MessageCriteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
		setStartRowNum();
	}
	
	public MessageCriteria(String page, String perPageNum) {
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
			this.perPageNum = 15;
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

	public String getKindOfMsg() {
		return kindOfMsg;
	}

	public void setKindOfMsg(String kindOfMsg) {
		this.kindOfMsg = kindOfMsg;
	}
	
	public String getLoginUser() {
		return loginUser;
	}

	public void setLoginUser(String loginUser) {
		this.loginUser = loginUser;
	}

	public MessageCriteria toCriteria() {
		MessageCriteria cri = new MessageCriteria();
		cri.setPage(this.page);
		cri.setPerPageNum(this.perPageNum);
		cri.setKeyword(this.keyword);
		cri.setSearchType(this.searchType);
		
		return cri;
	}
}
