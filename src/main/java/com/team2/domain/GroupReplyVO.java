package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GroupReplyVO {

	private int memno;
	private int rno;
	private int grpostno;
	private String content;
	private Date replydate;
	private String memimg;
	private String id;

	private int page;
}
