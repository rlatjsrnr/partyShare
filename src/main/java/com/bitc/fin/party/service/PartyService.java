package com.bitc.fin.party.service;

import java.util.List;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.member.vo.MemberVO;
import com.bitc.fin.party.vo.MapVO;
import com.bitc.fin.party.vo.PartyVO;

public interface PartyService {
	
	public int createParty(PartyVO vo) throws Exception;
	
	public void joinPartyMember(int pnum, int mnum) throws Exception;
	
	public List<PartyVO> partyList(Criteria cri) throws Exception;
	
	public PartyVO selectParty(int pnum) throws Exception;
	
	public PageMaker getPageMaker(Criteria cri) throws Exception;
	
	public List<String> getDescriptionList() throws Exception;
	
	public List<String> getCategoryList() throws Exception;
	
	public List<MemberVO> getJoinPartyMemberList(int pnum) throws Exception;
	
	public String partyMemberBan(int pnum, int mnum) throws Exception;
	
	public String setPartyFinish(int pnum) throws Exception;
	
	public void setLocation(MapVO map) throws Exception;
}
