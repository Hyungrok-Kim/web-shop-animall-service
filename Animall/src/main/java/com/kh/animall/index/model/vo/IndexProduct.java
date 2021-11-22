package com.kh.animall.index.model.vo;

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
public class IndexProduct {

	private int pno;
	private String ptype;
	private String pname;
	private String pexplain;
	private int pprice;
	private int saleprice;
	private int sale;
	private String pdetail;
	private char isdelete;
	private int reviewamount;
	private int productlevel;
}
