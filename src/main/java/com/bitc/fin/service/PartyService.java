package com.bitc.fin.service;

import java.util.List;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.vo.MapVO;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

public interface PartyService {
	
	public int createParty(PartyVO vo) throws Exception;
	
	public void joinPartyMember(int pNum, int mNum) throws Exception;
	
	public List<PartyVO> partyList(Criteria cri) throws Exception;
	
	public PartyVO selectParty(int pNum) throws Exception;
	
	public PageMaker getPageMaker(Criteria cri) throws Exception;
	
	public List<String> getDescriptionList() throws Exception;
	
	public List<String> getCategoryList() throws Exception;
	
	public List<MemberVO> getJoinPartyMemberList(int pNum) throws Exception;
	
	public String partyMemberBan(int pNum, int mNum) throws Exception;
	
	public String setPartyFinish(int pNum) throws Exception;
	
	public void setLocation(MapVO map) throws Exception;
}
