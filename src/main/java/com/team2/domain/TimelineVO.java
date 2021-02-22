package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class TimelineVO {
	
	private Integer postNo;
	private Integer memno;
	private String id;
	private String postCon;
	private String postCi;
	private String postLike;
	private Date postDate;
	private String addFile;
	private String fullname;

	private String[] files;

}
