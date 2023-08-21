package com.bitc.fin.service;

import java.util.List;

import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

public interface MemberService {
	/**
	 * @param mNum - 회원번호
	 * @return 회원 정보
	 * 회원 번호로 회원 정보 가져오기
	 */
	public MemberVO selectMember(int mNum) throws Exception;
	
	/**
	 * @param member - 회원 정보 수정 객체
	 * 회원 정보 수정
	 */
	public void modifyMember(MemberVO member) throws Exception;
	
	/**
	 * @param member - id, pw 로그인 객체
	 * @return 회원 객체
	 * 로그인
	 */
	public MemberVO login(MemberVO member) throws Exception;
	
	/**
	 * @param mNum - 회원번호로 참여했던 파티 리스트 검색
	 * @return - 참여 파티 목록
	 */
	public List<PartyVO> joinPartyList(int mNum) throws Exception;
	
	/**
	 * 파티 참여 횟수
	 */
	public int joinCnt(int mNum) throws Exception;
}
