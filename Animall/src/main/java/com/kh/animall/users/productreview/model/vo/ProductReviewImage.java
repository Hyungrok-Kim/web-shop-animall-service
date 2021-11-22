package com.kh.animall.users.productreview.model.vo;

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
public class ProductReviewImage {

	private int primgno;
	private String originname;
	private String changename;
	private String imgpath;
	private int imglevel;
	private Date uploaddate;
	private String isdelete;
	
}
