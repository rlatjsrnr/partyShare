package com.bitc.fin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.bitc.fin.vo.ChatVO;

public interface ChatDAO {

	@Select("SELECT * FROM (SELECT * FROM chat WHERE pNum=#{pNum} AND cNum <= #{startNo}) ORDER BY cNum desc")
	public List<ChatVO> getChatList(Map<String, Object> map);

	@Select("SELECT * FROM chat WHERE pNum=#{pNum} AND finish='N' ORDER BY cNum asc")
	public List<ChatVO> getFirstChatList(int pNum);

	@Insert("INSERT INTO chat(pNum, mNum, content) VALUES(#{pNum}, #{mNum}, #{content})")
	public int insertChat(ChatVO chat);
}
