package com.project.plus.tests;


import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.project.plus.domain.ClubVO;
import com.project.plus.service.ClubService;


public class FaqServiceClient {
	public static void main(String[] args) {
		AbstractApplicationContext container = 
				new GenericXmlApplicationContext("classpath:spring/root-context.xml");
		
		
		ClubService clubService = 
				(ClubService)container.getBean("ClubService");
		
//		
//		FaqVO vo = new FaqVO();
//		vo.setFaqNum(1);
//		vo.setFaqCategory("dhsmf");
//		vo.setFaqTitle("제목");
//		vo.setFaqContent("myBatis 내용입니다...");
//		
//
//		faqService.insertFaq(vo);
//
//		System.out.println("된당~~");
		
		ClubVO vo = new ClubVO();
		vo.setClubCategory("운동");
		vo.setClubName("안녕 ");
		vo.setClubKind(1);
		vo.setClubOnOff("on");
		vo.setClubMax(20);
		vo.setClubFreq("주3회");
		vo.setClubFee(1000);
		vo.setClubContent1("12313");
		vo.setClubContent2("13413");
		
		System.out.println("날짜오류");
		clubService.insertClub(vo);
		container.close();
	}

}
