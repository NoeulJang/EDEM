package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QreplyVO {

	private int answerNo;
	private int rno;
	private String content;
	private Date replydate;

}
