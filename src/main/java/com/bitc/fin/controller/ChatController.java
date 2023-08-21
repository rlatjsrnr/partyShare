package com.bitc.fin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.fin.service.ChatService;
import com.bitc.fin.service.PartyService;
import com.bitc.fin.vo.ChatVO;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ChatController {
	
	private final ChatService sc;
	private final PartyService ps;
	
	@RequestMapping("chat")
    public ModelAndView enterChat(@RequestParam int pNum, ModelAndView mav, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		
		List<ChatVO> firstList = null;
		List<MemberVO> joinMemberList = null;
		PartyVO party= null;
		try {
			joinMemberList = ps.getJoinPartyMemberList(pNum);
			if(!joinMemberList.contains(member)) {
				String message = "파티 맴버만 입장할 수 있습니다.";
				rttr.addFlashAttribute("message", message);
				mav.setViewName("redirect:partyDetail?pNum="+pNum);
				return mav;
			}
			
			firstList = sc.selectFirstChatList(pNum);
			party = ps.selectParty(pNum);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		mav.addObject("party",party);
		mav.addObject("mNum",member.getMNum());
		mav.addObject("firstList",firstList);
		mav.addObject("joinMemberList", joinMemberList);
		mav.setViewName("chat");
    	return mav;
    }
	
	/*
	@RequestMapping("chatList")
	@ResponseBody
	public List<ChatVO> selectChatList(@RequestParam int pNum,@RequestParam int endNo) {
		int startNo = endNo-11;
		Map<String,Object> map = new HashMap<>();
		map.put("pNum", pNum);
		map.put("startNo",endNo-1);
		List<ChatVO> list = sc.selectChatList(map);
		log.info("list= {}", list);
		return list;
	}
*/
	// 채팅 메세지 전달
	/*
    @MessageMapping("/send/{pNum}")
    @SendTo("/subscribe/chat/{pNum}")
    public ChatVO broadcasting(ChatVO chat) {
    	System.out.println("받을까?");
    	log.info("받아온 data={}",chat);
    	Map<String,Object> map = new HashMap<>();
    	map.put("chat", chat);
        sc.insertChat(chat);
        return chat;
    }
    */

}