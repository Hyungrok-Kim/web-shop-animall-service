package com.kh.animall.users.member.model.vo;

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

public class Member implements Serializable {
	
	private static final long serialVersionUID = 1004L;
	
	/*db 컬럼명 기준으로, 작성*/
	
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
}
