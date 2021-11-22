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
public class ProductReviewView {
	private int rno;
	private int pno;
	private String nname;
	private int rrating;
	private Date rdate;
	private String rcontent;
	private String changename;
	
}
