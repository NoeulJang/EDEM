package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.dto.PostDTO;

public interface NewsfeedMapper {
	/*
	 * List<PostDTO> newsfeedList(PageMaker newsfeedPage) throws Exception;
	 * 
	 * public int totalCount(int memNo) throws Exception;
	 */
	
	public List<PostDTO> searchList(@Param("cri") SearchCriteria cri,  @Param("pageMaker") PageMaker pageMaker)throws Exception;
	  
	public int searchCount(@Param("cri") SearchCriteria cri, @Param("userVO") UserVO userVO)throws Exception;
	
	public int headSearchCount(SearchCriteria cri)throws Exception;
	
	public List<PostDTO> headSearchList(@Param("cri") SearchCriteria cri,  @Param("pageMaker") PageMaker pageMaker)throws Exception;
	
}
