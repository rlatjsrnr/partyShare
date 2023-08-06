package com.bitc.fin.service;

import org.springframework.stereotype.Service;

import com.bitc.fin.dao.ImageDAO;
import com.bitc.fin.vo.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {

	private final ImageDAO dao;
	
	@Override
	public MemberVO login(MemberVO member) {
		return dao.login(member);
	}
	
	@Override
	public MemberVO selectMember(int mNum) {
		MemberVO member= dao.selectMember(mNum);
		return member;
	}

	@Override
	public void modifyMember(MemberVO member) {
		dao.modifyMember(member);
	}

	
	
}
