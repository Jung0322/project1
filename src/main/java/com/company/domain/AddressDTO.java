package com.company.domain;

import lombok.Setter;
import lombok.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AddressDTO {
	private String roadFullAddr; // 도로명 주소(전부)
	private String jibunAddr; // 지번 주소
	private String siNm; // 시도명
	private String sggNm; // 시군구
	private String emdNm; // 읍면동
	private String liNm; // 법정리
}
