package com.bitc.fin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.board.util.Criteria;
import com.bitc.fin.vo.PartyVO;

public interface PartyDAO {
	@Insert("INSERT INTO party(pName, host, sido, sigungu, address, startDate, endDate, pContext, mainCategory, subCategory, partyImage1) "
			+ "VALUES(#{pName}, #{host}, #{sido}, #{sigungu}, #{address}, now(), now(), #{pContext}, #{mainCategory}, #{subCategory}, #{partyImage1})")
	public int createParty(PartyVO vo);
	
	@Select("SELECT * FROM party ORDER BY pNum DESC limit #{startRow}, #{perPageNum}")
	public List<PartyVO> partyList(Criteria cri);
	
	@Select("SELECT * FROM party WHERE pNum=#{pNum}")
	public PartyVO selectParty(int pNum);
	
	@Select("SELECT count(*) FROM party")
	public int totalCount();
}
