package com.bitc.fin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.dao.PartyDAO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PartyServiceImpl implements PartyService {

	private final PartyDAO dao;
	
	@Override
	public int createParty(PartyVO vo) {
		dao.createParty(vo);
		return dao.lastIndex();
	}

	@Override
	public void joinPartyMember(int pNum, int mNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("pNum", pNum);
		map.put("mNum", mNum);
		dao.joinPartyMember(map);
	}
	
	@Override
	public List<PartyVO> partyList(Criteria cri) {
		return dao.partyList(cri);
	}

	@Override
	public PartyVO selectParty(int pNum) {
		return dao.selectParty(pNum);
	}

	@Override
	public PageMaker getPageMaker(Criteria cri) {
		int totalCount = dao.totalCount();
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(totalCount);
		pm.setDisplayPageNum(10);
		return pm;
	}



	
	
	
}
