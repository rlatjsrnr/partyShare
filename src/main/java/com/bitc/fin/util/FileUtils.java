package com.bitc.fin.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

/**
 * 파일 요청에 대한 처리를 할 class
 * upload, download, delete
 */
public class FileUtils {

	// 업로드 위치와 파일 정보 문자열로 반환
	public static String uploadFile(String realPath, MultipartFile file) throws Exception{
		
		String uploadFileName = ""; 
		
		UUID uid = UUID.randomUUID();
		String originalName = file.getOriginalFilename();
		String savedName = uid.toString().replace("-", "");
		
		savedName += "_"+(originalName.replace("_", " "));
		System.out.println(savedName);
		// URL encoding으로 변환된 파일 이름일 경우 공백을 + 로 치환하여 전달되기 때문에 
		// + 기호를 공백으로 치환
		savedName = savedName.replace("+", " ");
		
		String datePath = calcPath(realPath);
		File f = new File(realPath+datePath, savedName);
		file.transferTo(f);
		
		// 원본파일 업로드 완료
		
		// 업로드 된 파일의 확장자
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		System.out.println(formatName);
		if(MediaUtils.getMediaType(formatName ) != null) {
			// 이미지 파일 - Thumbnail 이미지 경로 반환
			uploadFileName = makeThumbnail(realPath, datePath, savedName, formatName);
			
		}else {
			// 일반파일
			uploadFileName = makePathName(datePath, savedName);
		}
		
		return uploadFileName;
	}
	
	// URL 경로로 변경하여 문자열 path 변환
	private static String makePathName(String datePath, String savedName) {
		// /yyyy/MM/dd/savedName
		String fileName = datePath + File.separator + savedName;
		fileName = fileName.replace(File.separatorChar, '/');
		return fileName;
	}
	
	private static String makeThumbnail(String realPath, String datePath, String savedName, String ext) throws IOException {
		String name = "";
		// 원본 이미지 정보
		File file = new File(realPath+datePath,savedName);
		// ImageScalr 는 BufferedImage 타입으로 이미지를 제어
		// ImageIO javax package ImageIO class는
		// image 타입의 파일을 쉽게 읽고 쓸 수 있도록 read, write method를 제공하는 class
		BufferedImage image = ImageIO.read(file);
		
		// scalr 객체를 이용해서 원본이미지를 복제한 Thumbnail 이미지 생성
		BufferedImage sourceIamge = Scalr.resize(image,   // 원본 이미지
								Scalr.Method.AUTOMATIC,   // 고정크기에 따른 상대 크기
								Scalr.Mode.FIT_TO_HEIGHT, // 고정 위치
								100 					  // 크기
								);
		String thumbnailImage = realPath+datePath+File.separator+"s_"+savedName;
		// ImageIO.write(출력할 이미지 데이터, 확장자, 출력 위치)
		ImageIO.write(sourceIamge, ext, new File(thumbnailImage));
		name = thumbnailImage.substring(realPath.length()).replace(File.separatorChar, '/');
		return name;
	}
	public static String calcPath(String realPath) {
		// window : \yyyy\mm\dd
		// linux : /yyyy/mm/dd
		String pattern = File.separator+"yyyy"+File.separator+"MM"+File.separator+"dd";
		LocalDate date = LocalDate.now();
		String datePath = date.format(DateTimeFormatter.ofPattern(pattern));
		File file = new File(realPath, datePath);
		if(!file.exists()) {
			file.mkdirs();
		}
		System.out.println(datePath);
		return datePath;
	}
	
}
