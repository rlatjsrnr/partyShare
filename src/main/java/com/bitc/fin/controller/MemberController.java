package com.bitc.fin.controller;

import java.io.File;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		MemberVO m = null;
		try {
			m = ms.login(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
		List<PartyVO> list = null;
		int joinCnt = 0;
		try {
			list = ms.joinPartyList(member.getMNum());
			joinCnt = ms.joinCnt(member.getMNum());
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("joinCnt", joinCnt);
		model.addAttribute("joinPartyList", list);
	}
	
	@RequestMapping("/modify")
	public String modifyMember(MemberVO member, MultipartHttpServletRequest request,Model model) {
		MultipartFile file = request.getFile("image");
		
		if(!file.isEmpty()) {
			String oldProfileImageName = member.getProfileImageName();
			String savedName = null;

			try {
				// 원래 프로필 이미지 삭제가 되면 새로운 이미지 업로드
				if(!oldProfileImageName.trim().equals("")) {
					if(FileUtils.deleteOriginalImage(realPath, oldProfileImageName)) {
						savedName = FileUtils.uploadOriginalImage(realPath, file);
					}
				}else {
					savedName = FileUtils.uploadOriginalImage(realPath, file);
				}
				member.setProfileImageName(savedName);
				ms.modifyMember(member);
				request.getSession().setAttribute("loginMember", member);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		return "redirect:profileModify";
	}
		
	@GetMapping("printProfileImage")
	public ResponseEntity<byte[]> uploadFile(String fileName) throws Exception{
		return new ResponseEntity<>(
				FileUtils.getBytes(realPath, fileName),
				FileUtils.getHeaders(fileName),
				HttpStatus.OK
				);
	}
	
}
