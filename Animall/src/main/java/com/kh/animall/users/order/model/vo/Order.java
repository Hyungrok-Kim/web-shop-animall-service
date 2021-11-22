package com.kh.animall.users.order.model.vo;
import java.time.LocalDate;

import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class Order {
    private	int ono;
    private	int pno;
	private int mno;
	private String paymethod;
	private LocalDate paydate;
	private String paystatus;
	private String orderer;
	private String orderphone;
	private String address;
	private String oaddr1;
	private String oaddr2;
	private String oaddr3;
	private String receiver;
	private String recephone;
}
