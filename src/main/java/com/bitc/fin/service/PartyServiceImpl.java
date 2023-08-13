package com.bitc.fin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.dao.PartyDAO;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PartyServiceImpl implements PartyService {

	private final PartyDAO dao;
	
	@Transactional
	@Override
	public int createParty(PartyVO vo) {
		dao.createParty(vo);
		int result = dao.lastIndex();
		return result;
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

	@Override
	public void makeAddress(HttpServletRequest request, PartyVO vo) {
		String[] jibun = request.getParameter("jibunAddress").split(" ");
		String detailAddress = request.getParameter("detailAddress");
		vo.setSido(jibun[0]);
		vo.setSigungu(jibun[1]);
		vo.setDetailAddress(detailAddress);
	}

	@Override
	public List<String> getDescriptionList() {
		System.out.println(dao.getDescriptionList());
		return dao.getDescriptionList();
	}

	@Override
	public List<String> getCategoryList() {
		System.out.println(dao.getCategoryList());
		return dao.getCategoryList();
	}

	@Override
	public List<MemberVO> getJoinPartyMemberList(int pNum) {
		return dao.getJoinPartyMember(pNum);
	}

	@Override
	public String partyMemberBan(int pNum, int mNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("pNum", pNum);
		map.put("mNum", mNum);
		if(dao.partyMemberBan(map) > 0) {
			return "삭제 성공";
		}else {
			return "삭제 실패";
		}
	}

	@Override
	public String setPartyFinish(int pNum) {
		if(dao.setPartyFinish(pNum) > 0) {
			return "파티 종료";
		}else {
			return "파티 종료 실패";
		}
	}

	
	
}
