package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {

	private int answerNo;
	private int memno;
	private String id;
	private String answerTitle;
	private String answerCon;
	private int postCount;
	private Date postDate;

}
