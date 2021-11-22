package com.kh.animall.users.styboard.model.vo;

import java.util.Date;

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
public class StyBoard {
	
	private int bno;
	private int styno;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private int blike;
	private String imgpath;
	private String click;
	private int likec;
	private int mno;
	private String mtype;
	private String ispre;
	private String shopaddress;
	private int shopphone;
	private int bsno;
	private String shopname;
}
