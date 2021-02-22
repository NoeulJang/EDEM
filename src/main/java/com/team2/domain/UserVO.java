package com.team2.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;

@Data
public class UserVO {

	private int memno;
	private String id;
	private String pw;
	private String name;
	private String ph;
	private String email;
	private String loc;
	private String job;
	private Date birth;
	private String gender;
	private String memimg;
	private String covimg;
	private Date regdate;
	private Integer followers;

}
