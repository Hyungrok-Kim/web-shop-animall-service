package com.kh.animall.users.product.model.vo;

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
public class Product {
	
	private int pno;
	private String ptype;
	private String pname;
	private String pcontent;
	private String pguide;
	private int pprice;
	private String pdetail;
	private String isDelete;
	private int reviewAmount;
		
}
