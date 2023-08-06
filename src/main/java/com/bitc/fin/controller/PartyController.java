package com.bitc.fin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("partyList")
	public String partyList(Model model){
		List<PartyVO> partyList = ps.partyList();
		model.addAttribute("partyList", partyList);
		return "partyList";
	}	
}
