package com.bitc.fin.service;

import java.util.List;
import java.util.Map;

import com.bitc.fin.vo.ChatVO;

public interface ChatService {

	List<ChatVO> selectChatList(Map<String, Object> map) throws Exception;

	List<ChatVO> selectFirstChatList(int pNum) throws Exception;

	void insertChat(ChatVO chat) throws Exception;
	
}
