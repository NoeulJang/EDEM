package com.team2.domain;

import java.util.Date;

import lombok.Data;

@Data
public class GroupVO {

	private int grno;
	private int memno;
	private String grname;
	private String grintro;
	private String grci;
	private Date grdate;
	private String fullname;
	
	private String[] files;

}
