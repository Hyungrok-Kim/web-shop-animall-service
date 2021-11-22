package com.kh.animall.users.stylist.model.vo;

import java.io.Serializable;
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
public class MyStylist implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
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
	private String ispre;
	private String certifino;
	private String certImg;
}	
