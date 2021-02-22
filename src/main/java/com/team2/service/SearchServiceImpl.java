package com.team2.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.mapper.SearchUserMapper;

import lombok.extern.log4j.Log4j;



@Log4j
@Service
public class SearchServiceImpl implements SearchService{
	
	@Inject SearchUserMapper search;

	@Override
	public int searchUserCount(SearchCriteria cri, PageMaker pageMaker) throws Exception {
		log.warn("searchCount service start...... ");
		return search.searchUserCount(cri, pageMaker);
	}

	@Override
	public List<UserVO> searchUserList(SearchCriteria cri, PageMaker pageMaker) throws Exception {
		log.warn("searchUserList service start...... ");
		return search.searchUserList(cri, pageMaker);
	}

}
