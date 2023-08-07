package com.bitc.fin.service;

import java.util.List;

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
	public void createParty(PartyVO vo) {
		dao.createParty(vo);
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
