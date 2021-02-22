package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private String id;
	private String pw;
	private String ph;
	private String email;
	private String name;
	private String birth;
	private String year;
	private String month;
	private String day;
	private String loc;
	private String job;
	private String memimg;
	private Date regdate;
	private String gender;
	private String covimg;
	


}