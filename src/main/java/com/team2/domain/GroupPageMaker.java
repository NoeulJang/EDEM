package com.team2.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class GroupPageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;

	private GroupCriteria cri;

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	/*
	 * private void calcData() {
	 * 
	 * endPage = cri.getPage() * cri.getPerPageNum(); startPage = (cri.getPage() -
	 * 1) * (cri.getPerPageNum()) + 1;
	 * 
	 * int tempEndPage = (int) (Math.ceil(totalCount / (double)
	 * cri.getPerPageNum()));
	 * 
	 * if (endPage > tempEndPage) { endPage = tempEndPage; } }
	 */

	/*
	 * public String makeQuery(int page) {
	 * 
	 * UriComponents uriComponents =
	 * UriComponentsBuilder.newInstance().queryParam("page", page)
	 * .queryParam("perPageNum", cri.getPerPageNum()).build();
	 * 
	 * return uriComponents.toUriString(); }
	 * 
	 * public String makeSearch(int page) {
	 * 
	 * UriComponents uriComponents =
	 * UriComponentsBuilder.newInstance().queryParam("page", page)
	 * .queryParam("perPageNum", cri.getPerPageNum()).queryParam("keyword",
	 * cri.getKeyWord()).build(); return uriComponents.toUriString(); }
	 */

	public boolean hasGroup() {
		return totalCount > 0;
	}

	public boolean hasNoGroup() {
		return totalCount == 0;
	}

}
