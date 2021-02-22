package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GroupNewsfeedVO {
	
	private int grpostno;
	private int memno;
	private int grno;
	private String grpocon;
	private int grpolike;
	private Date grpodate;
	private String id;
	private String memimg;
	
	private String fullname;
	private String files[];
	
	private int smemno;
	private String smemimg;

}
