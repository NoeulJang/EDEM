package com.team2.service;

import java.util.List;

import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;


public interface FollowService {
	
	//public void addComments(CommentsVO vo) throws Exception;
	
	public int followerCount(UserVO vo, SearchCriteria cri) throws Exception;
	
	public int followingCount(UserVO vo, SearchCriteria cri) throws Exception;
	
	
	public List<UserVO> followingListPage(UserVO vo, SearchCriteria cri) throws Exception;
	
	public List<UserVO> searchFollowingListPage(UserVO vo, SearchCriteria cri) throws Exception;
	
	public List<UserVO> followerListPage(UserVO vo, SearchCriteria cri) throws Exception;
	
	public List<UserVO> searchFollowerListPage(UserVO vo, SearchCriteria cri) throws Exception;
	
}
