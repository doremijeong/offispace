package kr.co.offispace.command;

public class MessageCriteriaCommand {
	
	private String page;
    private String perPageNum;
    private String searchType;
    private String keyword;
    private String kindOfMsg;
    
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

    public String getkindOfMsg() {
		return kindOfMsg;
	}
	public void setkindOfMsg(String kindOfMsg) {
		this.kindOfMsg = kindOfMsg;
	}
	
	
	public MessageCriteria toMsgCriteria() {
		MessageCriteria cri = new MessageCriteria();
    	
    	if(page != null && !page.isEmpty()) {
    		cri.setPage(Integer.parseInt(page));
    	}
    	
    	if(perPageNum != null && !perPageNum.isEmpty()) {
    		cri.setPerPageNum(Integer.parseInt(perPageNum));
    	}
    	
    	cri.setKeyword(keyword);
    	cri.setSearchType(searchType);
    	cri.setKindOfMsg(kindOfMsg);
    	
    	return cri;
    }
}
