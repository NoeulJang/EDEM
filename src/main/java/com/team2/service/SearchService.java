package com.team2.service;

import java.util.List;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;



public interface SearchService {
	
	public int searchUserCount (SearchCriteria cri, PageMaker pageMaker) throws Exception;
	
	public List<UserVO> searchUserList (SearchCriteria cri, PageMaker pageMaker) throws Exception;
}
