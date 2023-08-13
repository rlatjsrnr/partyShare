package com.bitc.fin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitc.fin.service.MemberService;
import com.bitc.fin.service.PartyService;
import com.bitc.fin.util.FileUtils;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MemberController {
	
	private final MemberService ms;
	private final PartyService ps;
	
	private final String uploadDir;
	private final ServletContext context;	
	private String realPath;
	
	@PostConstruct
	public void init() {
		realPath = context.getRealPath(File.separator+uploadDir);
		File file = new File(realPath);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println("데렉토리 생성완료");
		}
	}
	
	@PostMapping("/login")
	public String login(MemberVO member, HttpServletRequest request) {
		MemberVO m = ms.login(member);
		if(m.getMName() != null) {
			request.getSession().setAttribute("loginMember", m);
			return "redirect:/home";
		}else {
			return "home";
		}
		
	}
	
	@GetMapping("profileModify")
	public void profileModify(Model model, HttpSession session) {
		// 참여했던 파티 목록 필요
		MemberVO member = (MemberVO) session.getAttribute("loginMember");
		List<PartyVO> list = ms.joinPartyList(member.getMNum());
		int joinCnt = ms.joinCnt(member.getMNum());
		model.addAttribute("joinCnt", joinCnt);
		model.addAttribute("joinPartyList", list);
	}
	
	@RequestMapping("/modify")
	public String modifyMember(MemberVO member, MultipartHttpServletRequest request,Model model) {
		MultipartFile file = request.getFile("image");
		String mNum = request.getParameter("mNum");
		MemberVO m = ms.selectMember(Integer.parseInt(mNum));

		String oldProfileImageName = m.getProfileImageName();
		String savedName = null;

		try {
			// 원래 프로필 이미지 삭제가 되면 새로운 이미지 업로드
			if(oldProfileImageName != null) {
				if(FileUtils.deleteOriginalImage(realPath, oldProfileImageName)) {
					savedName = FileUtils.uploadOriginalImage(realPath, file);
				}
			}else {
				savedName = FileUtils.uploadOriginalImage(realPath, file);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		m.setProfileImageName(savedName);
		ms.modifyMember(m);
		model.addAttribute("loginMember", m);

		// 참여 파티 목록
		List<PartyVO> list = ms.joinPartyList(m.getMNum());
		int joinCnt = ms.joinCnt(m.getMNum());
		model.addAttribute("joinCnt", joinCnt);
		model.addAttribute("joinPartyList", list);
		return "profileModify";
	}
	
}
