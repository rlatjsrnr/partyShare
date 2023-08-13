package com.bitc.fin.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

public interface PartyService {
	
	public int createParty(PartyVO vo);
	
	public void joinPartyMember(int pNum, int mNum);
	
	public List<PartyVO> partyList(Criteria cri);
	
	public PartyVO selectParty(int pNum);
	
	public PageMaker getPageMaker(Criteria cri);
	
	public void makeAddress(HttpServletRequest request, PartyVO vo);
	
	public List<String> getDescriptionList();
	
	public List<String> getCategoryList();
	
	public List<MemberVO> getJoinPartyMemberList(int pNum);
	
	public String partyMemberBan(int pNum, int mNum);
	
	public String setPartyFinish(int pNum);
}
