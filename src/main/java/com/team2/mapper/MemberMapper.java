package com.team2.mapper;

import com.team2.dto.MemberDTO;
import com.team2.domain.MemberVO;

//회원가입
public interface MemberMapper {
	void selectMemberList(MemberVO vo) throws Exception;

	int idChk(MemberVO vo) throws Exception;

	public int checkMember(MemberVO vo) throws Exception;
	
	public void changePwd(MemberDTO dto)throws Exception;

}
