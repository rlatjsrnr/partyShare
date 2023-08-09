package com.bitc.fin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

public interface MemberDAO {
	
	// 로그인
	@Select("SELECT * FROM member WHERE mId=#{mId} AND mPw=#{mPw}")
	public MemberVO login(MemberVO member);
	
	// 회원 번호로 회원 정보 검색 
	@Select("select * from member where mNum=#{mNum}")
	public MemberVO selectMember(int mNum);
	
	// 회원 정보 수정
	@Update("UPDATE member SET mPw=#{mPw}, mName=#{mName}, mAge=#{mAge}, mEmail=#{mEmail}, mGender=#{mGender}, mAddr=#{mAddr}, profileImageName=#{profileImageName} WHERE mNum=#{mNum}")
	public int modifyMember(MemberVO member);
	
	@Select("SELECT * FROM party WHERE pNum IN (SELECT pNum FROM joinMember WHERE mNum=#{mNum})")
	public List<PartyVO> joinPartyList(int mNum);
	
	@Select("SELECT count(*) FROM joinMember WHERE mNum=#{mNum}")
	public int joinCnt(int mNum);
}
