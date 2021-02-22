package com.team2.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


//@Builder
//@Getter
//@Setter
//@ToString
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentsDTO {

	private String id;
	private int memNo;
	private String memImg;
	private int comNo;
	private int postNo;
	private String comCon;
	private Date comDate;
	
	
/*	
	public Newsfeed(int postNo, int memNo, String id, String postCon, String addFile, String postCi, int postLike,
			Date postDate) {
		//super();
		this.postNo = postNo;
		this.memNo = memNo;
		this.id = id;
		this.postCon = postCon;
		this.addFile = addFile;
		this.postCi = postCi;
		this.postLike = postLike;
		this.postDate = postDate;
	}
	
	public Newsfeed() {
		super();
	}
	

*/

	
}
