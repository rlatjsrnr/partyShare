package com.bitc.fin.chat;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.bitc.fin.service.ChatService;
import com.bitc.fin.vo.ChatVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{

	private static List<WebSocketSession> sessionList = new ArrayList<>();

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
		String content = strs[2].substring(strs[2].indexOf(":")+1, strs[2].length()-1);
		
		ChatVO chat = new ChatVO(Integer.parseInt(pNum), Integer.parseInt(mNum), content);
		try {
			cs.insertChat(chat);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
		for(WebSocketSession sess : sessionList) {
			try {
				sess.sendMessage(new TextMessage(message.getPayload()));
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
