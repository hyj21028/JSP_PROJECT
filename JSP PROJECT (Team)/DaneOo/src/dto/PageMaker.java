package dto;

public class PageMaker {
	private int pageSize = 12;
	private int startPage;		// 시작페이지
	private int endPage;		// 끝페이지
	private int currPage = 1;	// 현재페이지
	private int start;				// 한페이지의 시작 레코드
	private int totalCount;		// 
	private boolean prev;
	private boolean next;
	
	public PageMaker(int currPage, int totalCount) {
		this.currPage = currPage;			// 현재 페이지
		this.totalCount = totalCount;	// 전체 페이지의 갯수
		start=(currPage-1)*pageSize;	// 각 페이지의 시작 레코드 0, 10, 20, 30..
		endPage = (int)(Math.ceil(currPage/(double)pageSize)*pageSize);		// 페이지의 끝부분		
		startPage = (endPage-pageSize)+1;		// 10-10+1
		int totalPage = (int)(Math.ceil(totalCount/(double)pageSize));		// ex) 전체페이지가 21개 라면 , 21/10 = 2.1 > 3 페이지까지 존재	, 1~10p / 11~20p / 21p 까지
		if(endPage > totalPage)endPage = totalPage;
		prev = startPage == 1 ? false : true; 	// 1페이지 일때 prev 버튼을 비활성화하기 위해서
		next = endPage < totalPage ? true : false;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getCurrPage() {
		return currPage;
	}

	public int getStart() {
		return start;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}
	
}
