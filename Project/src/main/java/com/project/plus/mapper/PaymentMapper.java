package com.project.plus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.plus.domain.PaymentVO;

public interface PaymentMapper {
	
	//public List<PaymentVO> selectPaymentList(PaymentVO vo);
	public List<PaymentVO> selectPaymentList( @Param("memberNum") int memberNum, @Param("rowStart") int rowStart, @Param("rowEnd") int rowEnd) throws Exception;
	public int selectPaymentListCount(@Param("memberNum") int memberNum) throws Exception;
	
	
	public void insertChargePoint(PaymentVO vo);
	
	public void useMemberPoint(PaymentVO vo);
	public void getClubPoint(PaymentVO vo);
	
}
//dao 라고 생각하면 된다 . 
