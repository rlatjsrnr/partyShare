package com.bitc.fin.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PartyVO {
	private int pNum;
	private String pName;
	private int host;
	private String sido;
	private String sigungu;
	private String address;
	private Date startDate;
	private Date endDate;
	private String pContext;
	private String mainCategory;
	private String subCategory;
	private String finish;
	private int viewCnt;
	private byte[] partyImage1;
	private byte[] partyImage2;
	private byte[] partyImage3;
	private String detailAddress;
	
}
