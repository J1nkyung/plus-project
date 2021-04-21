package com.project.plus.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentVO {
	private int payNum;
	private int memberNum;
	private int clubNum;
	private int payAmount;
	private String payMethod;
	private Date payDate;
	private String payTime;
	/*추가한 vo*/
	private int memberPoint;
	// 현정 추가 0404
	private String memberNickname;
	private String clubName;
	
	
}
