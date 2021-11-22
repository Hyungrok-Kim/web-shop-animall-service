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
public class ProductListViews {

	private int pno;
	private String pname;
	private int pprice;
	private String changename;
	private String imgpath;
	private String originname;
	private int saleprice;
	private int sale;
	private String pexplain;
	private int productlevel;
}
