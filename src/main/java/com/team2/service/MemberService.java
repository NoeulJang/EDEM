package com.team2.service;

import javax.servlet.http.HttpServletResponse;

import com.team2.dto.MemberDTO;
import com.team2.domain.MemberVO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;

	public int idChk(MemberVO vo) throws Exception;

	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;
	
	//비밀번호찾기
	public void SearchPw(HttpServletResponse resp, MemberVO vo) throws Exception;

	void findPw(MemberVO vo) throws Exception;
	
	public int checkMember(MemberVO vo) throws Exception;
	
	public void changePwd(MemberDTO dto)throws Exception;
	
}