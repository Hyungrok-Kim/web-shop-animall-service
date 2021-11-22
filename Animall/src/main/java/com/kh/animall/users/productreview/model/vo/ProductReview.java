package com.kh.animall.users.productreview.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

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
@Component

public class ProductReview {
	
	private int rno;
	private int pno;
	private int mno;
	private int rrating;
	private Date rdate;
	private String rcontent;
	private int primgno;
	
	
}
