package com.bitc.fin.chat.service;

import java.util.List;
import java.util.Map;

import com.bitc.fin.chat.vo.ChatVO;

public interface ChatService {

	List<ChatVO> selectChatList(int pnum, int endNo) throws Exception;

	List<ChatVO> selectFirstChatList(int pnum) throws Exception;

	int insertChat(ChatVO chat) throws Exception;
	
	int getTotalCount(int pnum) throws Exception;
}
