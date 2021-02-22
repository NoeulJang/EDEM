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
public class PostDTO {

	private int postNo;
	private int memNo;
	private String id;
	private String postCon;
	private String fullname;
	private String postCi;
	private int postLike;
	private Date postDate;
	private String memImg;
	private String covImg;
	private PostDTO timeLine;
	
	
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
