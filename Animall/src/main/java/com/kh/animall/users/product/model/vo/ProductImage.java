package com.kh.animall.users.product.model.vo;

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

public class ProductImage {

	private int pimgno;
	private int pno;
	private String originname;
	private String changename;
	private String imgpath;
	private int imglevel;
	private Date uploaddate;
	private String isdelete;
	
	
}
