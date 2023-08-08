package com.bitc.fin.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bitc.fin.service.ImageService;
import com.bitc.fin.service.PartyService;
import com.bitc.fin.util.FileUtils;
import com.bitc.fin.vo.MemberVO;
import com.bitc.fin.vo.PartyVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ImageController {
	
	private final ImageService is;
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
		MemberVO m = is.login(member);
		if(m.getMName() != null) {
			request.getSession().setAttribute("loginMember", m);
			return "profileModify";
		}else {
			return "home";
		}
		
	}
	
	@RequestMapping("/modify")
	public String uploadImage(MemberVO member, MultipartHttpServletRequest request) throws IOException {
		MultipartFile file = request.getFile("image");
		String mNum = request.getParameter("mNum");
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		member.setProfileImageName(savedName);
		
		is.modifyMember(member);
		return "profileModify";
	}
	
	
	// db에 저장된 이미지 출력
	@RequestMapping("/profileImage")
	public ResponseEntity<byte[]> getProfile(HttpServletRequest request) {
		String mNum = request.getParameter("mNum");
		MemberVO member = is.selectMember(Integer.parseInt(mNum));
		ResponseEntity<byte[]> result = null;
		
		/*
		// 로그인 안했으면 디폴트 이미지 출력
		if(member.getProfileImageName() == null) {
			String savedName = uploadFile("default.png", new File())
			File file = new File(defaultImagePath);
			try {
				
				member.setProfileImageName("default.png");
				is.modifyMember(member);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			
			try {
				// 헤더에다가 전달하는 파일의 타입을 지정 - MIME타입
				HttpHeaders header = new HttpHeaders();
				header.add("Content-type", Files.probeContentType(file.toPath()));
				// FileCopyUtils.copyToByteArray - 파일을 이진배열로 변환
				result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
			} catch (IOException e) {
				e.printStackTrace();
			}
			*/
		// 로그인 했으면 db 저장된 회원이미지 가져와서 출력
		//}else {
		//}
			MemberVO m = is.selectMember(Integer.parseInt(mNum));
			// db에 byte[]타입으로 저장돼있음
			String path = m.getProfileImageName();
			File file = new File(realPath,path);
			HttpHeaders header = new HttpHeaders();
			try {
				header.add("Content-type", Files.probeContentType(file.toPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
			//result = new ResponseEntity<byte[]>(file., header, HttpStatus.OK);
		
		
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
	
	/**
	 * 파일 업로드 후 업로드 된 파일 이름 반환
	 */
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
