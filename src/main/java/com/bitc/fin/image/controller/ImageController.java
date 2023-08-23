package com.bitc.fin.image.controller;

import java.io.File;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitc.fin.member.service.MemberService;
import com.bitc.fin.member.vo.MemberVO;
import com.bitc.fin.util.FileUtils;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/image")
public class ImageController {

	private final MemberService ms;
	
	private final String uploadDir;
	private final String uploadPartyDir;
	private final ServletContext context;	
	private String profileRealPath;
	private String partyRealPath;
	
	@PostConstruct
	public void init() {
		profileRealPath = context.getRealPath(File.separator+uploadDir);
		File file = new File(profileRealPath);
		if(!file.exists()) {
			file.mkdirs();
			System.out.println("profile 디렉토리 생성완료");
		}
		partyRealPath = context.getRealPath(File.separator+uploadPartyDir);
		File file1 = new File(partyRealPath);
		if(!file1.exists()) {
			file1.mkdirs();
			System.out.println("party 디렉토리 생성완료");
		}
	}
	
	// 프로필 이미지 출력
		@GetMapping("/printProfileImage")
		public ResponseEntity<byte[]> printProfileImage(String fileName) throws Exception{
			return new ResponseEntity<>(
					FileUtils.getBytes(profileRealPath, fileName),
					FileUtils.getHeaders(fileName),
					HttpStatus.OK
					);
		}
		
		@GetMapping("/printProfileImageNum")
		public ResponseEntity<byte[]> printProfileImageNum(int mnum) throws Exception{
			MemberVO member = ms.selectMember(mnum);
			String fileName = member.getProfileImageName();
			return new ResponseEntity<>(
					FileUtils.getBytes(profileRealPath, fileName),
					FileUtils.getHeaders(fileName),
					HttpStatus.OK
					);
		}
		
		@GetMapping("/printPartyImage")
		public ResponseEntity<byte[]> uploadFile(String fileName) throws Exception{
			return new ResponseEntity<>(
					FileUtils.getBytes(partyRealPath, fileName),
					FileUtils.getHeaders(fileName),
					HttpStatus.OK
					);
		}
}
