package com.kh.animall.users.order.model.vo;
import java.time.LocalDate;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class OrderList {
	    private	int ono;
	    private int pno;
		private int mno;
		private String paymethod;
		private LocalDate paydate;
		private String paystatus;
		private String orderer;
		private String address;
		private String receiver;
		
		private int odno;
		private int oamount;
		
		private int pimgno;
		private int pprice;
		private int imglevel;
		
}
