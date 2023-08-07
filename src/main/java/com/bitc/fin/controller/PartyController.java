package com.bitc.fin.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.service.PartyService;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PartyController {
	
	private final PartyService ps;
	
	@GetMapping("createParty")
	public void createParty() {}
	
	@PostMapping("createParty")
	public String createParty(HttpServletRequest request, PartyVO vo, @RequestParam MultipartFile image) {
		try {
			System.out.println(image.getOriginalFilename());
			vo.setPartyImage1(image.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}
		ps.createParty(vo);
		return "redirect:/partyList";
	}
	
	@GetMapping("partyList/{page}")
	@ResponseBody
	public Map<String, Object> partyList(@PathVariable(name="page") int page){
		Map<String, Object> map = new HashMap<>();
		Criteria cri = new Criteria(page, 10);
		List<PartyVO> partyList = ps.partyList(cri);
		PageMaker pm = ps.getPageMaker(cri);
		map.put("pm", pm);
		map.put("list", partyList);
		return map;
	}	
}
