package com.project.plus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.CriteriaMem;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerMem;
import com.project.plus.domain.PaymentVO;
import com.project.plus.service.MemberService;
import com.project.plus.service.PaymentService;


@Controller
@SessionAttributes("payment") // 값 변동이 없어도 payment라는 이름에 같이 담겨서 나올 수 있도록.
public class PaymentController {
	
	@Autowired 
	private PaymentService paymentService;	 
	@Autowired 
	private MemberService memberService;	

	
	@RequestMapping("/getPaymentList")
	public String getPaymentList(PaymentVO vo, MemberVO membervo,HttpSession session, @RequestParam("memberNum") int memberNum, Model model , CriteriaMem cri) throws Exception {
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setMemberNum(user.getMemberNum());
		membervo.setMemberNum(user.getMemberNum());
		
		//페이징 20210412
		int rowStart = cri.getRowStart(); 
		int rowEnd = cri.getRowEnd();
		System.out.println("rowStart + rowEnd  : " + rowStart + " / " +  rowEnd);
		int currentMemberPoint = memberService.selectMemberPoint(membervo); // 현재 포인트
		List<PaymentVO> paymentList = paymentService.selectPaymentList( memberNum, rowStart, rowEnd);
		model.addAttribute("currentMemberPoint", currentMemberPoint);
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("memberNum", memberNum);
		

		int totalCount = paymentService.selectPaymentListCount(memberNum);  
		PageMakerMem pgmm = new PageMakerMem();
		pgmm.setCriMem(cri);
		pgmm.setTotalCount(totalCount);
		model.addAttribute("PageMakerComments" , pgmm);
		
		return "paymentList.point";
	}
	
	@RequestMapping("/chargePointPopup")
	public String chargePointPopup(PaymentVO vo, Model model) {
		return "mypage/point/chargePoint";
	}
	
	@RequestMapping("/chargePoint")
	public void chargePoint(PaymentVO vo, MemberVO membervo) {
//		vo.setMemberNum(3);
//		membervo.setMemberNum(3);
		// 유저가 현재 가지고 있는 포인트
		int currentMemberPoint = memberService.selectMemberPoint(membervo);
		// 콘솔 값 확인 
		System.out.println("현재 포인트 " + currentMemberPoint );
		System.out.println("************************** chargePoint.do ****************************");
		System.out.println("payAmount : " + vo.getPayAmount()+ "나오니 ?");
		int payAmountt = vo.getPayAmount();
		int chargePayAmount = payAmountt + currentMemberPoint;
		System.out.println("합친포인트"+ chargePayAmount);
		membervo.setMemberPoint(chargePayAmount);
		System.out.println("멤버 포인트 " + vo.getPayAmount() + "충전완료");
		memberService.updateMemberPoint(membervo);
		paymentService.insertChargePoint(vo);
		
	} 
}
