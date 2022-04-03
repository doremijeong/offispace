package kr.co.offispace.command;

public class JobKeywordSearchPageMaker {



	private int totalCount; // 전체 행의 개수
	private int startPage = 1; // 시작 페이지 번호
	private int endPage = 1; // 마지막 페이지 번호
	private int realEndPage; // 끝 페이지 번호
	private boolean prev; // 이전페이지 버튼 유무
	private boolean next; // 다음페이지 버튼 유무

	private int displayPageNum = 15; // 한 페이지에 보여줄 페이지번호 개수

	JobKeywordSearchCriteria jobKeywordSearchCriteria =  new JobKeywordSearchCriteria();

	public JobKeywordSearchCriteria getJobKeywordSearchCriteria() {
		return jobKeywordSearchCriteria;
	}

	public void setJobKeywordSearchCriteria(JobKeywordSearchCriteria jobKeywordSearchCriteria) {
		this.jobKeywordSearchCriteria = jobKeywordSearchCriteria;
	}


	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public boolean isNext() {
		return next;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}


	// starPage,endPage, prev, next 설정. by totalCount
	private void calcData() {
		endPage = (int) (Math.ceil(jobKeywordSearchCriteria.getPage() / (double) displayPageNum)
							* displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		realEndPage = (int) (Math.ceil(totalCount / (double) jobKeywordSearchCriteria.getPerPageNum()));

		if (startPage < 0) {
			startPage = 1;
		}
		if (endPage > realEndPage) {
			endPage = realEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage >= realEndPage ? false : true;
	}



}
