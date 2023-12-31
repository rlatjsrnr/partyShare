package com.bitc.fin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.fin.dao.MemberDAO;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberDAO dao;
	
	@Override
	public MemberVO login(MemberVO member) throws Exception {
		return dao.login(member);
	}
	
	@Override
	public MemberVO selectMember(int mNum) throws Exception{
		MemberVO member= dao.selectMember(mNum);
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) throws Exception{
		dao.modifyMember(member);
	}

	@Override
	public List<PartyVO> joinPartyList(int mNum) throws Exception{
		return dao.joinPartyList(mNum);
	}

	@Override
	public int joinCnt(int mNum) throws Exception{
		return dao.joinCnt(mNum);
	}

	
	
}
