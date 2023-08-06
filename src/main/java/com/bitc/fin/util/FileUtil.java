package com.bitc.fin.util;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.IOException;

public class FileUtil {
	public static byte[] getBytes(String path) {
		FileInputStream fis = null;
		ByteArrayOutputStream byteOs = null;
		try {
			//FileIS 생성
			fis = new FileInputStream(path);
			//byteArrayOS 생성
			byteOs = new ByteArrayOutputStream();
			//바이트 하나씩 가져올 변수
			int readFile = 0;
			//하나씩 꺼내서 읽는데 다 읽으면 -1을 리턴
			while((readFile = fis.read()) != -1) {
				//생성한 OS에 읽은 데이터 쓰기
				byteOs.write(readFile);
			}
		}catch(IOException e){
			System.out.println(e.toString());
		}finally {
			if(fis != null) {
				try {fis.close();}catch(IOException e) {}
			}
		}
		//OS에 쓴 데이터 byte[]로 리턴
		return byteOs.toByteArray();
	}
}
