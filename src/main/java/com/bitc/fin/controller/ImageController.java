package com.bitc.fin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bitc.fin.service.ImageService;
import com.bitc.fin.service.PartyService;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ImageController {
	
	private final ImageService is;
	private final PartyService ps;
	
	@PostMapping("/login")
	public String login(MemberVO member, HttpServletRequest request) {
		MemberVO m = is.login(member);
		if(m.getMName() != null) {
			request.getSession().setAttribute("loginMember", m);
			return "profileModify";
		}else {
			return "home";
		}
		
	}
	
	@RequestMapping("/modify")
	public String uploadImage(MemberVO member, HttpServletRequest request, @RequestParam MultipartFile image) {
		try {
			member.setUpload(image);
		} catch (IOException e) {
			e.printStackTrace();
		}
		is.modifyMember(member);
		return "profileModify";
	}
	
	// db에 저장된 이미지 출력
	@RequestMapping("/profileImage")
	public ResponseEntity<byte[]> getProfile(HttpServletRequest request) {
		String mNum = request.getParameter("mNum");
		
		ResponseEntity<byte[]> result = null;
		
		// 로그인 안했으면 디폴트 이미지 출력
		if(mNum == null) {
			String defaultImagePath = request.getServletContext().getRealPath("/resources/img/default.png");
			File file = new File(defaultImagePath);
			
			try {
				// 헤더에다가 전달하는 파일의 타입을 지정 - MIME타입
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				// FileCopyUtils.copyToByteArray - 파일을 이진배열로 변환
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		// 로그인 했으면 db 저장된 회원이미지 가져와서 출력
		}else {
			MemberVO m = is.selectMember(Integer.parseInt(mNum));
			// db에 byte[]타입으로 저장돼있음
			byte[] profileImage = m.getProfileImage();
			String path = m.getProfileImageName();
			File file = new File(path);
			HttpHeaders header = new HttpHeaders();
			try {
				header.add("Content-type", Files.probeContentType(file.toPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
			result = new ResponseEntity<byte[]>(profileImage, header, HttpStatus.OK);
		}
		
		return result;
	}
	
	// 파티 번호를 전달받아 파티이미지 출력
	@RequestMapping("/partyImage")
	public ResponseEntity<byte[]> getPartyImage(HttpServletRequest request) {
		String pNum = request.getParameter("pNum");
		
		ResponseEntity<byte[]> result = null;
		
		if(pNum == null) {
			String defaultImagePath = request.getServletContext().getRealPath("/resources/img/default.png");
			File file = new File(defaultImagePath);
			
			try {
				// 헤더에다가 전달하는 파일의 타입을 지정 - MIME타입
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				// FileCopyUtils.copyToByteArray - 파일을 이진배열로 변환
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		// 로그인 했으면 db 저장된 회원이미지 가져와서 출력
		}else {
			PartyVO vo = ps.selectParty(Integer.parseInt(pNum));
			// db에 byte[]타입으로 저장돼있음
			byte[] partyImage = vo.getPartyImage1();
			//String path = vo.getProfileImageName();
			File file = new File("party.jpg");
			HttpHeaders header = new HttpHeaders();
			try {
				header.add("Content-type", Files.probeContentType(file.toPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
			result = new ResponseEntity<byte[]>(partyImage, header, HttpStatus.OK);
		}
		
		return result;
	}
}
