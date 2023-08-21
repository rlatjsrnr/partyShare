package com.bitc.fin.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ChatVO {
	private int cNum;
	private int pNum;
	private int mNum;
	private String content;
	private String finish;
	
	public ChatVO(int pNum, int mNum, String content) {
		this.pNum = pNum;
		this.mNum = mNum;
		this.content = content;
	}
	
}
