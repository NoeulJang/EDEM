package com.team2.service;

import java.util.List;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.dto.PostDTO;


public interface NewsfeedService {

	
	public int searchCount(SearchCriteria cri, UserVO userVO) throws Exception;
	
	public List<PostDTO> searchList(SearchCriteria cri, PageMaker pageMaker) throws Exception;

	public int headSearchCount(SearchCriteria cri) throws Exception;
	
	public List<PostDTO> headSearchList(SearchCriteria cri, PageMaker pageMaker) throws Exception;
}
