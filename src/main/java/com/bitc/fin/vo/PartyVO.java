package com.bitc.fin.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
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
	private String detailAddress;
	private String startDate;
	private String endDate;
	private String pContext;
	private String description;
	private String category;
	private String finish;
	private int viewCnt;
	private String partyImage1;
	private String partyImage2;
	private String partyImage3;
	
	
	public String getFormatStartDate() {
        String newStartDate = this.startDate;
     try {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date startDateDt = inputFormat.parse(this.startDate);
        
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
        newStartDate = outputFormat.format(startDateDt);
     } catch (ParseException e) {
        System.out.println("getStartDate에서 오류 발생");
     }
     return newStartDate;
  }
  
  public String getFormatEndDate() {
        String newEndDate = this.endDate;
     try {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date endDateDt = inputFormat.parse(this.endDate);
        
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy년 MM월 dd일");
        newEndDate = outputFormat.format(endDateDt);
     } catch (ParseException e) {
        System.out.println("getEndDate에서 오류 발생");
     }
     return newEndDate;
  }
}
