package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.MemberVO;

public interface PaymentMapper {
	
	public List<PaymentVO> selectPaymentList(PaymentVO vo);
	public void insertChargePoint(PaymentVO vo);
	
	public void useMemberPoint(PaymentVO vo);
	public void getClubPoint(PaymentVO vo);
	
}
//dao 라고 생각하면 된다 . 
