package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class CommentVO {
	
	private int cno;
	private int pno;
	private String writer;
	private String content;
	private String creg_date;
	private String cmod_date;
	private Integer rate;
	
}

