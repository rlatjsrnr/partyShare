package com.bitc.fin.service;

import java.util.List;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.vo.PartyVO;

public interface PartyService {
	
	public void createParty(PartyVO vo);
	
	public List<PartyVO> partyList(Criteria cri);
	
	public PartyVO selectParty(int pNum);
	
	public PageMaker getPageMaker(Criteria cri);
}
