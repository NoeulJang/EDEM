package com.team2.domain;

import java.util.Date;
import lombok.Data;

@Data
public class CommentsVO {

	private Integer comNo;
	private Integer postNo;
	private Integer memNo;
	private String id;
	private String comCon;
	private Date comDate;
	

}
