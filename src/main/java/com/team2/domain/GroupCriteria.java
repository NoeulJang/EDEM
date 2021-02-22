package com.team2.domain;

import lombok.Data;

@Data
public class GroupCriteria{

	private int page;	
	private int perPageNum;
	private String keyword;
	private int endPage;
	private int startPage;
	
	public void setEndPage(){
		 this.endPage = page * perPageNum;
	}
	
	public int getEndPage() {
		return this.endPage;
	}
	
	public void setStartPage() {
		this.startPage = ((page - 1) * (perPageNum) + 1);
	}
	
	public int getStartPage() {
		return this.startPage;
	}
	
	public GroupCriteria(){
		this.page = 1;
		this.perPageNum = 10;
	}

	public void setPage(int page){
		
		if(page <= 0){
			this.page = 1;
			return;
		}
		this.page = page;
	}
}


