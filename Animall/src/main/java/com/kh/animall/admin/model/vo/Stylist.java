package com.kh.animall.admin.model.vo;

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
public class Stylist {

	
	  private int styno;
	  private int mno;
	  private String bsno;
	  private String bsname;
	  private String styname;
	  private Date birth;
	  private String cellphone;
	  private String shopname;
	  private String shopphone;
	  private String shopaddress;
	  private char ispre;
	  private int certifino;
	
}
