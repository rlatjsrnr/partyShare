package com.bitc.fin.controller;


import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.service.PartyService;
import com.bitc.fin.util.FileUtils;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class PartyController {
	
	private final PartyService ps;
	
	private final String uploadPartyDir;
	// application context
	private final ServletContext context;
	
	private String realPath;
	
	@PostConstruct
	public void init() {
		realPath = context.getRealPath(File.separator+uploadPartyDir);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
		}
	}
	@GetMapping("createName")
	public String createName() {
		return "createParty/name";
	}
	
	@PostMapping("createName")
	public String createName(PartyVO vo, Model model) {
		model.addAttribute("vo", vo);
		return "createParty/date";
	}
	@PostMapping("createDate")
	public String createDate(PartyVO vo, Model model) {
		model.addAttribute("vo", vo);
		return "createParty/context";
	}
	@PostMapping("createContext")
	public String createContext(PartyVO vo, Model model) {
		model.addAttribute("vo", vo);
		List<String> list = ps.getDescriptionList();
		System.out.println(list);
		model.addAttribute("description", list);
		return "createParty/description";
	}
	@PostMapping("createDescription")
	public String createMainCategory(PartyVO vo, Model model) {
		System.out.println(vo);
		List<String> list = ps.getCategoryList();
		System.out.println(list);
		model.addAttribute("category", list);
		model.addAttribute("vo", vo);
		return "createParty/category";
	}
	@PostMapping("createCategory")
	public String createSubCategory(PartyVO vo, Model model) {
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "createParty/address";
	}
	
	@PostMapping("createAddress")
	public String createSubAddress(PartyVO vo, Model model, HttpServletRequest request) {
		ps.makeAddress(request, vo);
		System.out.println(vo);
		
		model.addAttribute("vo", vo);
		
		return "createParty/image";
	}
	
	@PostMapping("createImage")
	public String createParty(MultipartHttpServletRequest request, PartyVO vo) {
		System.out.println(vo);
		MultipartFile file1 = request.getFile("image1");
		MultipartFile file2 = request.getFile("image2");
		MultipartFile file3 = request.getFile("image3");

		try {
			String savedName1 = FileUtils.uploadThumbnailImage(realPath, file1);
			vo.setPartyImage1(savedName1);
			
			String savedName2 = FileUtils.uploadOriginalImage(realPath, file2);
			vo.setPartyImage2(savedName2);
			
			String savedName3 = FileUtils.uploadOriginalImage(realPath, file3);
			vo.setPartyImage3(savedName3);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		int pNum = ps.createParty(vo);
		
		ps.joinPartyMember(pNum, vo.getHost());
		System.out.println(vo);
		return "createParty/success";
	}
	
	@GetMapping("partyList")
	public void partyList() {}
	
	
	// 파일의 경로를 리스트 내에 객체에 담아서 ${list.URL}
	@GetMapping("partyList/{page}")
	@ResponseBody
	public Map<String, Object> partyList(@PathVariable(name="page") int page){
		Map<String, Object> map = new HashMap<>();
		Criteria cri = new Criteria(page, 20);
		List<PartyVO> partyList = ps.partyList(cri);
		PageMaker pm = ps.getPageMaker(cri);
		map.put("pm", pm);
		map.put("list", partyList);
		return map;
	}
	
	@GetMapping("partyHost")
	public void partyManagement(Model model, int pNum) {
		List<MemberVO> list = ps.getJoinPartyMemberList(pNum);
		model.addAttribute("partyJoinMember",list);
	}
	
	@GetMapping("partyMemberBan")
	public String partyMemberBan(Model model, int mNum, int pNum) {
		String result = ps.partyMemberBan(pNum, mNum);
		model.addAttribute("message", result);
		List<MemberVO> list = ps.getJoinPartyMemberList(pNum);
		model.addAttribute("partyJoinMember", list);
		return "partyHost";
	}
	
	@GetMapping("partyFinish")
	public String partyFinish(int pNum, RedirectAttributes rttr) {
		String result = ps.setPartyFinish(pNum);
		rttr.addFlashAttribute("message", result);
		return "redirect:partyList";
	}
	
	@GetMapping("chat")
	public void chat() {}
	
}
