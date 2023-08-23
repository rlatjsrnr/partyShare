package com.bitc.fin.chat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bitc.fin.chat.service.ChatService;
import com.bitc.fin.chat.vo.ChatVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{

	private static List<WebSocketSession> sessionList = new ArrayList<>();

	ObjectMapper objectMapper = new ObjectMapper();
	
	@Autowired
	ChatService cs;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session){
		log.info("연결됨");
		sessionList.add(session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) {
		
		String msg = message.getPayload().replace("\"", "");
		String[] strs = msg.split(",");
		String pNum = strs[0].substring(strs[0].indexOf(":")+1);
		String mNum = strs[1].substring(strs[1].indexOf(":")+1);
		String content = strs[2].substring(strs[2].indexOf(":")+1);
		String path = strs[3].substring(strs[3].indexOf(":")+1);
		String nick = strs[4].substring(strs[4].indexOf(":")+1, strs[4].length()-1);
		
		ChatVO chat = new ChatVO(Integer.parseInt(pNum), Integer.parseInt(mNum), nick, content);
		
		String lastChatNum = "";
		try {
			lastChatNum += cs.insertChat(chat);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("pnum", pNum);
		map.put("mnum", mNum);
		map.put("content", content);
		map.put("path", path);
		map.put("nick", nick);
		map.put("cnum", lastChatNum);
		String json = null;
		try {
			json = objectMapper.writeValueAsString(map);
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		
		for(WebSocketSession sess : sessionList) {
			try {
				sess.sendMessage(new TextMessage(json));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
		sessionList.remove(session);
	}
}
