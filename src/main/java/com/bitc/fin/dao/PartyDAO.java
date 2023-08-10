package com.bitc.fin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.board.util.Criteria;
import com.bitc.fin.vo.PartyVO;

public interface PartyDAO {
	@Insert("INSERT INTO party(pName, host, startDate, endDate, pContext, mainCategory, subCategory, sido, sigungu, address, detailAddress, partyImage1,partyImage2,partyImage3) "
			+ "VALUES(#{pName}, #{host}, #{startDate},#{endDate}, #{pContext}, #{mainCategory}, #{subCategory}, #{sido},#{sigungu}, #{address}, #{detailAddress}, #{partyImage1},#{partyImage2},#{partyImage3})")
	public int createParty(PartyVO vo);
	
	@Select("SELECT LAST_INSERT_ID()")
	public int lastIndex();
	
	@Select("SELECT * FROM party ORDER BY pNum DESC limit #{startRow}, #{perPageNum}")
	public List<PartyVO> partyList(Criteria cri);
	
	@Select("SELECT * FROM party WHERE pNum=#{pNum}")
	public PartyVO selectParty(int pNum);
	
	@Select("SELECT count(*) FROM party")
	public int totalCount();
	
	@Insert("INSERT INTO joinMember(pNum, mNum) VALUES(#{pNum}, #{mNum})")
	public int joinPartyMember(Map<String, Integer> map);
}
