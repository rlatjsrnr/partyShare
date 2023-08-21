package com.bitc.fin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bitc.fin.dao.ChatDAO;
import com.bitc.fin.vo.ChatVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {

	private final ChatDAO dao;
	
	@Override
	public List<ChatVO> selectChatList(Map<String, Object> map) throws Exception{
		return dao.getChatList(map);
	}

	@Override
	public List<ChatVO> selectFirstChatList(int pNum) throws Exception{
		return dao.getFirstChatList(pNum);
	}

	@Override
	public void insertChat(ChatVO chat) throws Exception{
		dao.insertChat(chat);
	}

}
