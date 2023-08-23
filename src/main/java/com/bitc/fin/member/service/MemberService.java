package com.bitc.fin.member.service;

import java.util.List;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.member.vo.MemberVO;
import com.bitc.fin.party.vo.PartyVO;

public interface MemberService {
	/**
	 * @param mnum - 회원번호
	 * @return 회원 정보
	 * 회원 번호로 회원 정보 가져오기
	 */
	public MemberVO selectMember(int mnum) throws Exception;
	
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
	 * @param mnum - 회원번호로 참여했던 파티 리스트 검색
	 * @return - 참여 파티 목록
	 */
	public List<PartyVO> joinPartyList(int mnum, Criteria cri) throws Exception;
	
	/**
	 * 파티 참여 횟수
	 */
	public int joinCnt(int mnum) throws Exception;
}
