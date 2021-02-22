package com.team2.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//import com.team2.domain.PageCriteria;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PageMaker extends PageCriteria {

	private int total;  //2
	private int totalPages;  //1
	private int startPage; //1
	private int endPage;  //1
	private int memNo;
	private boolean prev;
	private boolean next;
	private PageCriteria pageCriteria; 
	
	public void setTotal(int total) {
		this.total = total;
		
		calcData(total);
	}
	
	
	private void calcData(int total) {
		
		if (total == 0) {
			this.totalPages = 0;
			this.startPage = 0;
			this.endPage = 0 ;
		} else {
			this.totalPages = total / getPerPageNum();
			if (total % getPerPageNum() > 0) {
				this.totalPages++;
			}
			int modVal = getPageNo() % 5;
			this.startPage = getPageNo() / 5 * 5 + 1;
			if (modVal == 0) {
				this.startPage = startPage - 5;
			}
			
			this.endPage = startPage + 4;
			if (endPage > totalPages) {
				this.endPage = totalPages;
			}
		}
		
		
		
		
		prev = (startPage == 1 || startPage == 0) ? false : true;
		next = endPage * getPerPageNum() >= total ? false : true;
		
		
		
		/*
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = (endPage - displayPageNum) + 1;

		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;

		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		*/
	}
	
	
 
	public boolean hasNoContent() {
		return total == 0;
	}

	public boolean hasContent() {
		return total > 0;
	}
	
	

	public String makeQuery(int pageNo) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("pageNo", pageNo)
				.queryParam("perPageNum", pageCriteria.getPerPageNum()).build();

		return uriComponents.toUriString();
	}
	
	
	
	public String makeSearch(int pageNo) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.queryParam("pageNo", pageNo)
				.queryParam("perPageNum", ((SearchCriteria)pageCriteria).getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)pageCriteria).getSearchType())
				.queryParam("keyword", ((SearchCriteria)pageCriteria).getKeyword()).build();
		return uriComponents.toUriString();
	}
	
	
	/*
	public String makeSearch(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", pageCriteria.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
				.queryParam("keyword", ((SearchCriteria) cri).getKeyword()).build();

		return uriComponents.toUriString();
	}
	*/
	
	
	
	/*
	 * @Override public String toString() { return super.toString() +
	 * " NewsfeedPage [total=" + total + ", totalPages=" + totalPages +
	 * " startPage " + startPage + " endPage " + endPage + " memNo " + memNo+
	 * " prev " + prev+ " next " + next+"]"; }
	 */

}
