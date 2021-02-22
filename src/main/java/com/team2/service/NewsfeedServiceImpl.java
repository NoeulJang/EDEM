package com.team2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team2.domain.PageMaker;
import com.team2.domain.SearchCriteria;
import com.team2.domain.UserVO;
import com.team2.dto.PostDTO;
import com.team2.mapper.NewsfeedMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class NewsfeedServiceImpl implements NewsfeedService {
	
	@Autowired
	private NewsfeedMapper postMapper;
	
	
	@Override
	@Transactional
	public int searchCount(SearchCriteria cri, UserVO userVO) throws Exception {
		log.warn("newfeed searchCount Service Start ... ");
		log.warn("@@@@@@@@@@@@@@@@@@@@"+cri + "@@@@@@@@@@@@@@@@" + userVO);
		return postMapper.searchCount(cri, userVO);
	};
	
	
	@Override
	@Transactional
	public int headSearchCount(SearchCriteria cri) throws Exception {
		log.warn("head searchCount Service Start ... ");
		log.warn("@@@@@@@@@@@@@@@@@@@@"+cri + "@@@@@@@@@@@@@@@@");
		return postMapper.headSearchCount(cri);
	};
	
	@Override
	@Transactional
	public List<PostDTO> searchList(SearchCriteria cri,  PageMaker pageMaker) throws Exception {
		log.warn("newfeed searchList Service ... ");
		return postMapper.searchList(cri, pageMaker);
	}
	
	
	@Override
	@Transactional
	public List<PostDTO> headSearchList(SearchCriteria cri,  PageMaker pageMaker) throws Exception {
		log.warn("head searchList Service ... ");
		return postMapper.headSearchList(cri, pageMaker);
	}

}
