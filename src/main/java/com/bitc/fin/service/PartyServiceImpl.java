package com.bitc.fin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.bitc.fin.dao.PartyDAO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PartyServiceImpl implements PartyService {

	private final PartyDAO dao;
	
	@Override
	public void createParty(PartyVO vo) {
		dao.createParty(vo);
	}

	@Override
	public List<PartyVO> partyList() {
		return dao.partyList();
	}

	@Override
	public PartyVO selectParty(int pNum) {
		return dao.selectParty(pNum);
	}
	
	
}
