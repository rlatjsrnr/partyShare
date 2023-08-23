package com.bitc.fin.image.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		public ResponseEntity<byte[]> printPartyImage(String fileName) throws Exception{
			return new ResponseEntity<>(
					FileUtils.getBytes(partyRealPath, fileName),
					FileUtils.getHeaders(fileName),
					HttpStatus.OK
					);
		}
		
		
		@PostMapping("uploadAjax")
		@ResponseBody
		public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception{
			String savedName = FileUtils.uploadOriginalImage(profileRealPath, file);
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/plain;charset=utf-8");
			return new ResponseEntity<>(savedName, headers, HttpStatus.OK);
		}

		@DeleteMapping(value="deleteFile", produces="text/plain;charset=utf-8")
		@ResponseBody
		public ResponseEntity<String> deleteFile(@RequestBody String fileName) throws Exception{
			ResponseEntity<String> entity = null;
			System.out.println(fileName);
			boolean isDeleted = FileUtils.deleteOriginalImage(profileRealPath, fileName);
			
			if(isDeleted) {
				entity = new ResponseEntity<>("삭제성공",HttpStatus.OK);
			}else {
				entity = new ResponseEntity<>("삭제실패",HttpStatus.CREATED);
			}
			return entity;
		}
}
