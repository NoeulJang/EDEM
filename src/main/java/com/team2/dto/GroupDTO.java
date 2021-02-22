package com.team2.dto;

import com.team2.domain.UserVO;

import lombok.Data;

@Data
public class GroupDTO{
	
	private int memno;
	private int grno;
	private int page;
	private int pageStart;
	private int size;
	private String keyword;
	private String type;
	
}
