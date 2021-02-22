package com.team2.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;


//@NoArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class PageCriteria {

	private int pageNo;	
	private int perPageNum;
	
	public PageCriteria(){
		this.pageNo = 1;
		this.perPageNum = 10;
	}

	public int setPageNo(int pageNo){
		
		if(pageNo <= 0){
			this.pageNo = 1;
			return this.pageNo;
		}
		
		return this.pageNo = pageNo;
	}
	
	public void setPerPageNum(int perPageNum){
		
		if(perPageNum <= 0 || perPageNum > 100){
			this.perPageNum = 10;
			return;
		}
		
		this.perPageNum = perPageNum;
	}
	
	
	
	/*
	public int getPageNo() {
		return pageNo;
	}	
	
	
	//method for MyBatis SQL Mapper 
	public int getPerPageNum(){
			
		return this.perPageNum;
	}
	*/
	
	//method for MyBatis SQL Mapper - 
	/*
	public int getPageStart() {
		
		return (this.pageNo -1)* perPageNum;
	}
	*/
	
	
	@Override
	public String toString() {
		return super.toString() + " PageCriteria [pageNo=" + pageNo + ", perPageNum="
				+ perPageNum + "]";
	}

	
}


