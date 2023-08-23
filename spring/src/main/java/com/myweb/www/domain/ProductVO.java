package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductVO {
	private int pno; //제품번호, primary key, auto_increment
	private String type_a; // 분류 list 불러오는 용도 
	private String pname; //모델명
	private int price; // 가격
	private String content; // 제품 상세 정보
}
