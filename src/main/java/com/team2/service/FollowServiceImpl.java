package com.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.mapper.FollowMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper followMapper;

	public int followerCount(UserVO vo, SearchCriteria cri) throws Exception {
		log.warn("..... followerCount Start .....");
		return followMapper.followerCount(vo, cri);
	}
	
	public int followingCount(UserVO vo, SearchCriteria cri) throws Exception {
		log.warn("..... followerCount Start .....");
		return followMapper.followingCount(vo, cri);
	}

	public List<UserVO> followingListPage(UserVO vo, SearchCriteria cri) throws Exception { 
		log.warn("..... check followingListPage .....");
		return followMapper.followingListPage(vo, cri);
	}
	
	public List<UserVO> searchFollowingListPage(UserVO vo, SearchCriteria cri) throws Exception {
		log.warn("..... check search followingListPage .....");
		return followMapper.searchFollowingListPage(vo, cri);
	}
	
	public List<UserVO> followerListPage(UserVO vo, SearchCriteria cri) throws Exception { 
		log.warn("..... check followerListPage .....");
		return followMapper.followerListPage(vo, cri);
	}
	
	public List<UserVO> searchFollowerListPage(UserVO vo, SearchCriteria cri) throws Exception {
		log.warn("..... check search followerListPage .....");
		return followMapper.searchFollowerListPage(vo, cri);
	}
	

}
