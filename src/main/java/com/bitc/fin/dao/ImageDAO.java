package com.bitc.fin.dao;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bitc.fin.vo.MemberVO;

public interface ImageDAO {
	
	// 로그인
	@Select("SELECT * FROM member WHERE mId=#{mId} AND mPw=#{mPw}")
	public MemberVO login(MemberVO member);
	
	// 회원 번호로 회원 정보 검색 
	@Select("select * from member where mNum=#{mNum}")
	public MemberVO selectMember(int mNum);
	
	// 회원 정보 수정
	@Update("UPDATE member SET mPw=#{mPw}, mName=#{mName}, mAge=#{mAge}, mGender=#{mGender}, mAddr=#{mAddr}, profileImage=#{profileImage}, profileImageName=#{profileImageName} WHERE mNum=#{mNum}")
	public int modifyMember(MemberVO member);
}
