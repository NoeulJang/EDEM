package com.team2.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.team2.domain.UserVO;
import com.team2.dto.LoginDTO;
import com.team2.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return userMapper.login(dto);
	}

	@Override
	public void keepLogin(String id, String sessionId, Date next) throws Exception {

		userMapper.keepLogin(id, sessionId, next);

	}

	@Override
	public UserVO checkLoginBefore(String value) {

		return userMapper.checkUserWithSessionKey(value);
	}
	
	@Override
	public Integer countMyFollowers(Integer memno) throws Exception{
		return userMapper.countMyFollowers(memno);
	}
}
