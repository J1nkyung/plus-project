package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.PaymentVO;

public interface PaymentService {
	List<PaymentVO> selectPaymentList(PaymentVO vo);
	void insertChargePoint(PaymentVO vo);
	void useMemberPoint(PaymentVO vo);
	void getClubPoint(PaymentVO vo);
	
}

