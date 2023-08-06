package com.bitc.fin.service;

import com.bitc.fin.vo.MemberVO;

public interface ImageService {
	/**
	 * @param mNum - 회원번호
	 * @return 회원 정보
	 * 회원 번호로 회원 정보 가져오기
	 */
	public MemberVO selectMember(int mNum);
	
	/**
	 * @param member - 회원 정보 수정 객체
	 * 회원 정보 수정
	 */
	public void modifyMember(MemberVO member);
	
	/**
	 * @param member - id, pw 로그인 객체
	 * @return 회원 객체
	 * 로그인
	 */
	public MemberVO login(MemberVO member);
}
