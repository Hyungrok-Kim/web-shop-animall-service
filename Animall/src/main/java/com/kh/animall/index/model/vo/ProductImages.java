package com.kh.animall.index.model.vo;

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
public class ProductImages {

	 private int pimgno;
	 private int pno;
	 private String originname;
	 private String changename;
	 private String imgpath;
	 private int imglevel;
	 private Date uploaddate;
	 private char isdelete;
}
