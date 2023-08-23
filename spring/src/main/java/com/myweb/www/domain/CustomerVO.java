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
public class CustomerVO {
	
	private String cid;
	private String cname;
	private String cpw;
	private int cage;
	private String cgender;
	private String cnick_name;
	private String cemail;
	private String ctel;
	private String cadd;
	private String cdate;
}
