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
public class BoardReply {
	
	private int rno;
	private int bno;
	private int mno;
	private String rcontent;
	private Date rdate;
	private String nname;

}
