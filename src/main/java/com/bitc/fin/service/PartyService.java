package com.bitc.fin.service;

import java.util.List;

import com.bitc.fin.vo.PartyVO;

public interface PartyService {
	
	public void createParty(PartyVO vo);
	
	public List<PartyVO> partyList();
	
	public PartyVO selectParty(int pNum);
}
