package com.kh.animall.users.cart.model.vo;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor

public class Cart {
 private int cno;
 private int mno;
 private String nname;
 private int pno;
 private String pname;
 private int amount;
 private int pprice;
 private String isfreeship;
 private int pimgno;
 private int money;
 private String changename;
}
