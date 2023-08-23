package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ConsultVO {
	private int csno;
	private String csid;
	private String cscontent;
	private String csdate;
	private String cstype;
	private String csname;
	private String cstel;
}
