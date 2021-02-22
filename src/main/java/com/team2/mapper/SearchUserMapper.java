package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;

public interface SearchUserMapper {
	
	public int searchUserCount (@Param("cri")SearchCriteria cri, @Param("pageMaker") PageMaker pageMaker) throws Exception;
	
	public List<UserVO> searchUserList (@Param("cri")SearchCriteria cri, @Param("pageMaker") PageMaker pageMaker) throws Exception;

}
