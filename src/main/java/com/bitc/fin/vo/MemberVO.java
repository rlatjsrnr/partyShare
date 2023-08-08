package com.bitc.fin.vo;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberVO {
	private int mNum;
	private String mId;
	private String mPw;
	private String mName;
	private String mNick;
	private int mAge;
	private String mGender;
	private String mEmail;
	private int mBanCnt;
	private String mAddr;
	private int mJoinCnt;
	private String mBlackYN;
	private String withdraw;
	private String profileImageName;

	public MemberVO(String mId, String mPw) {
		this.mId = mId;
		this.mPw = mPw;
	}

}
