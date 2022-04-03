package kr.co.offispace.command;

public class ApprovalCriteriaCommand {

	private String page;
    private String perPageNum;
    private String searchType;
    private String keyword;
    private String option;
    private String formKind;

	public String getFormKind() {
		return formKind;
	}
	public void setFormKind(String formKind) {
		this.formKind = formKind;
	}
	public String getOption() {
		return option;
	}
	public void setOption(String option) {
		this.option = option;
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

    public ApprovalCriteria toCriteria() {
    	ApprovalCriteria cri = new ApprovalCriteria();

    	if(page != null && !page.isEmpty()) {
    		cri.setPage(Integer.parseInt(page));
    	}

    	if(perPageNum != null && !perPageNum.isEmpty()) {
    		cri.setPerPageNum(Integer.parseInt(perPageNum));
    	}

    	cri.setKeyword(keyword);
    	cri.setSearchType(searchType);
    	cri.setOption(this.option);
    	cri.setFormKind(this.formKind);

    	return cri;
    }
}
