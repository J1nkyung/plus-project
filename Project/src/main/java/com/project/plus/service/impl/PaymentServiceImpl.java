package com.project.plus.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.PaymentVO;
import com.project.plus.mapper.PaymentMapper;
import com.project.plus.service.PaymentService;

@Service("PaymentService")
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PaymentMapper mapper;

	@Override
	public List<PaymentVO> selectPaymentList(PaymentVO vo) {
		List<PaymentVO> paymentList = mapper.selectPaymentList(vo);
		return paymentList;
	}

	@Override
	public void insertChargePoint(PaymentVO vo) {
		System.out.println("여기는 serviceImpl클래스에 vo가 담기는지 확인하는 곳입니다 mapper.insertChargePoint(vo)");
		mapper.insertChargePoint(vo);
	}

	@Override
	public void useMemberPoint(PaymentVO vo) {
		mapper.useMemberPoint(vo);		
	}
	@Override
	public void getClubPoint(PaymentVO vo) {
		mapper.getClubPoint(vo);		
	}
	
	
	
}
