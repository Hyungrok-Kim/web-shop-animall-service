package com.kh.animall.users.productinquiry.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ProductInquiryList {
	private int pinqno;
	private int pno;
	private int mno;
	private String pititle;
	private String picontent;
	private int ref_rno;
	private Date pidate;
	private String pianswer;
	private String issecret;
	private String nname;
}
