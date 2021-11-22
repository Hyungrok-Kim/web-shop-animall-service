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
public class Board {
	
	private int bno;
	private int mno;
	private String btitle;
	private String bcontent;
	private Date bdate;
	private int blike;
	private String imgpath;
	private String nname;
	private String click;
	private int likec;
	private int replyc;
	private String mtype;
}

