package com.team2.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;

public interface FollowMapper {
	

	public int followerCount(@Param("vo") UserVO vo, @Param("cri") SearchCriteria cri) throws Exception;
	
	public int followingCount(@Param("vo") UserVO vo, @Param("cri") SearchCriteria cri) throws Exception;
	
	public List<UserVO> followingListPage(@Param("vo") UserVO vo, @Param("cri") SearchCriteria cri) throws Exception;
	
	public List<UserVO> searchFollowingListPage(@Param("vo") UserVO vo, @Param("cri") SearchCriteria cri) throws Exception;

	public List<UserVO> followerListPage(@Param("vo") UserVO vo, @Param("cri") SearchCriteria cri) throws Exception;
	
	public List<UserVO> searchFollowerListPage(@Param("vo") UserVO vo, @Param("cri") SearchCriteria cri) throws Exception;

	
}
