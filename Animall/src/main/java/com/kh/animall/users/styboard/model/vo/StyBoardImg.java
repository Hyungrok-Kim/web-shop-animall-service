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
public class StyBoardImg {
	
	private int bimgno;
	private int bno;
	private int styno;
	private String originname;
	private String changename;
	private String imgpath;
	private int imglevel;
	private Date uploaddate;
	private String isdelete;
	

}
