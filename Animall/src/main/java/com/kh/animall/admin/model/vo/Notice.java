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
public class Notice {
	
	private int nno;
	private int mno;
	private String ntitle;
	private String ncontent;
    private Date ndate;
    
}