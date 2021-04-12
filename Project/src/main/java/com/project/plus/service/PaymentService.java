package com.project.plus.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.plus.domain.PaymentVO;

public interface PaymentService {
	//List<PaymentVO> selectPaymentList(PaymentVO vo);
	public List<PaymentVO> selectPaymentList( @Param("memberNum") int memberNum, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) throws Exception;
	public int selectPaymentListCount(@Param("memberNum") int memberNum) throws Exception;
	
	
	void insertChargePoint(PaymentVO vo);
	void useMemberPoint(PaymentVO vo);
	void getClubPoint(PaymentVO vo);
	
	
}

