package com.kh.animall.users.board.model.vo;

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

public class BoardImg {
	
	private int bimgno;
	private int bno;
	private int mno;
	private String originname;
	private String changename;
	private String imgpath;
	private int imglevel;
	private Date uploaddate;
	private String isdelete;
	

}

