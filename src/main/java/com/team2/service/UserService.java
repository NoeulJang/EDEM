package com.team2.service;

import java.util.Date;

import com.team2.domain.UserVO;
import com.team2.dto.LoginDTO;

public interface UserService {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String uid, String sessionId, Date next) throws Exception;

	public UserVO checkLoginBefore(String value);
	
	public Integer countMyFollowers(Integer memno) throws Exception;
}
