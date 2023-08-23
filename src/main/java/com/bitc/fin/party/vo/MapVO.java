package com.bitc.fin.party.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MapVO {
	private int pnum;
	private String lat; // 위도
	private String lng; // 경도
	
	public MapVO(String lat, String lng) {
		this.lat = lat;
		this.lng = lng;
	}
}
