package com.team2.domain;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Builder
@Getter
@Setter
@ToString
public class PostVO {

	private int postNo;
	private int memNo;
	private String id;
	private String postCon;
	private String addFile;
	private String postCi;
	private int postLike;
	private Date postDate;
	//private String memImg;
	//private String covImg;
	//private Newsfeed timeLine;
	

	/*
	 * public TimeLine(int postNo, int memNo, String postCon, String addFile, String
	 * postCi, int postLike, Date postDate) { this.postNo = postNo; //게시물번호
	 * this.memNo = memNo; this.postCon = postCon; this.addFile = addFile;
	 * this.postCi = postCi; this.postLike = postLike; this.postDate = postDate; }
	 * 
	 * public TimeLine(int postNo, String id, String postCon, String addFile, String
	 * postCi, int postLike, Date postDate) { this.postNo = postNo; //게시물번호 this.id
	 * = id; this.postCon = postCon; this.addFile = addFile; this.postCi = postCi;
	 * this.postLike = postLike; this.postDate = postDate; }//CommentsViewHandler
	 * 
	 * public TimeLine(int postNo, int memNo, String id, String memImg, String
	 * covImg, String postCon, String addFile, String postCi, int postLike, Date
	 * postDate) { this.postNo = postNo; //게시물번호 this.memNo = memNo; this.id = id;
	 * this.memImg = memImg; this.covImg = covImg; this.postCon = postCon;
	 * this.addFile = addFile; this.postCi = postCi; this.postLike = postLike;
	 * this.postDate = postDate; }//commentsFriendViewHandler-dao
	 * 
	 * public TimeLine(int postNo, String id, String memImg, String covImg, String
	 * postCon, String addFile, String postCi, int postLike, Date postDate) {
	 * this.postNo = postNo; //게시물번호 this.id = id; this.memImg = memImg; this.covImg
	 * = covImg; this.postCon = postCon; this.addFile = addFile; this.postCi =
	 * postCi; this.postLike = postLike; this.postDate = postDate;
	 * }//commentsFriendViewHandler-service
	 */
	
	
	/*
	 * public TimeLine(TimeLine timeLine) { this.timeLine = timeLine; }
	 * 
	 * public TimeLine getTimeLine() { return timeLine; }
	 * 
	 * public int getPostNo() { return postNo; }
	 * 
	 * public int getMemNo() { return memNo; }
	 * 
	 * public String getId() { return id; }
	 * 
	 * public String getMemImg() { return memImg; }
	 * 
	 * public String getCovImg() { return covImg; }
	 * 
	 * public String getPostCon() { return postCon; }
	 * 
	 * public String getAddFile() { return addFile; }
	 * 
	 * public String getPostCi() { return postCi; }
	 * 
	 * public int getPostLike() { return postLike; }
	 * 
	 * public Date getPostDate() { return postDate; }
	 */

}
