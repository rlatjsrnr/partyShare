package com.bitc.fin.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitc.board.util.Criteria;
import com.bitc.board.util.PageMaker;
import com.bitc.fin.service.PartyService;
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
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "createParty/date";
	}
	@PostMapping("createDate")
	public String createDate(PartyVO vo, Model model) {
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "createParty/context";
	}
	@PostMapping("createContext")
	public String createContext(PartyVO vo, Model model) {
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "createParty/mainCategory";
	}
	@PostMapping("createMainCategory")
	public String createMainCategory(PartyVO vo, Model model) {
		System.out.println(vo);
		model.addAttribute("vo", vo);
		return "createParty/subCategory";
	}
	@PostMapping("createSubCategory")
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
	
	
	@GetMapping("createParty")
	public void createParty() {}
	
	@PostMapping("createParty")
	public String createParty(MultipartHttpServletRequest request, PartyVO vo) throws IOException {
		System.out.println(vo);
		MultipartFile file1 = request.getFile("image1");
		String savedName1 = uploadFile(file1.getOriginalFilename(), file1.getBytes());
		vo.setPartyImage1(savedName1);
		MultipartFile file2 = request.getFile("image2");
		String savedName2 = uploadFile(file2.getOriginalFilename(), file2.getBytes());
		vo.setPartyImage2(savedName2);
		MultipartFile file3 = request.getFile("image3");
		String savedName3 = uploadFile(file3.getOriginalFilename(), file3.getBytes());
		vo.setPartyImage3(savedName3);
		int pNum = ps.createParty(vo);
		
		ps.joinPartyMember(pNum, vo.getHost());
		System.out.println(vo);
		return "redirect:/partyList";
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
	
	
	
	public String uploadFile(String original, byte[] filedata) throws IOException {
		String savedName="";
		UUID uuid = UUID.randomUUID();
		// 32개의 랜덤한 문자 + 4개의 - 조합으로 총 36개의 문자
		System.out.println(uuid);
		savedName = uuid.toString().replace("-", "")+"_"+original;
		System.out.println(savedName);
		
		// spring에서 제공하는 파일 헬퍼 객체
		FileCopyUtils.copy(filedata, new File(realPath, savedName));
		return savedName;
	}
}
