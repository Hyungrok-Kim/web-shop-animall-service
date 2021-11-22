package com.kh.animall.admin.model.vo;

import java.io.Serializable;
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

public class Members implements Serializable {

	private int mno;
	private String id;
	private String pwd;
	private String nname;
	private String email;
	private String mtype;
	private Date joinDate;
	private Date chdate;
	private String address;
	private String zip;
	private String addr1;
	private String addr2;
	private String domain;
	private String warn;
	
}
