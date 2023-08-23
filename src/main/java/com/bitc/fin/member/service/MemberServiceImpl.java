package com.bitc.fin.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.member.dao.MemberDAO;
import com.bitc.fin.member.vo.MemberVO;
import com.bitc.fin.party.vo.PartyVO;

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
	public MemberVO selectMember(int mnum) throws Exception{
		MemberVO member= dao.selectMember(mnum);
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) throws Exception{
		dao.modifyMember(member);
	}

	@Override
	public List<PartyVO> joinPartyList(int mnum, Criteria cri) throws Exception{
		
		return dao.joinPartyList(mnum, cri);
	}

	@Override
	public int joinCnt(int mnum) throws Exception{
		return dao.joinCnt(mnum);
	}

}
