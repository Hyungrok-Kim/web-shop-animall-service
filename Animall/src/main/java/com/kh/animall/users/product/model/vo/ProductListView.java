package com.kh.animall.users.product.model.vo;

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

public class ProductListView {

	private int pno;
	private String pname;
	private int pprice;
	private String pcontent;
	private String changename;
	
}
