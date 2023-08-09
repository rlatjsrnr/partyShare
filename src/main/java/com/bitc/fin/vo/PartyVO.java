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
	private String startDate;
	private String endDate;
	private String pContext;
	private String mainCategory;
	private String subCategory;
	private String finish;
	private int viewCnt;
	private String partyImage1;
	private String partyImage2;
	private String partyImage3;
	private String detailAddress;
}
