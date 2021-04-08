package com.project.plus.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.domain.HeartVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.service.ApplyService;
import com.project.plus.service.ClubService;
import com.project.plus.service.HeartService;
import com.project.plus.service.MemberService;
import com.project.plus.service.PaymentService;

@Controller
/* @SessionAttributes("heart") */
public class HeartController {

	@Autowired
	private HeartService heartService;
	@Autowired
	private ApplyService applyService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private ClubService clubService;

	@RequestMapping("/getHeartList")
	public String getHeartList(ApplyVO avo, HeartVO vo, Model model , HttpSession session) {
		System.out.println("********** HeartList 컨트롤러 **********");
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setMemberNum(user.getMemberNum());
		avo.setMemberNum(user.getMemberNum());
		System.out.println("멤버넘버 확인 vo :" + vo.getMemberNum()  + "  avo  : " + avo.getMemberNum());
		
		model.addAttribute("checkApplyClub", applyService.checkApplyClubByMemberNum(avo));
		model.addAttribute("selectFreeClub", heartService.selectFreeClub(vo));
		model.addAttribute("selectNoFreeClub", heartService.selectNoFreeClub(vo));

		return "heartList.heart";
	}

	@RequestMapping(value = "/applyFreeClub", produces = "application/text;charset=UTF-8")//.do뺌
	@ResponseBody
	public String applyFreeClub(ApplyVO vo, Model model,HttpSession session, HttpServletRequest request) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		vo.setMemberNum(user.getMemberNum());
		String msg = "Nooo";
		System.out.println("************************** applyFreeClub.do ****************************");
		String[] clubNumArr = request.getParameterValues("clubNumArr");
		if (clubNumArr != null) {
			System.out.println("clubNumArr : " + clubNumArr.length);
			System.out.println("*********** " + vo.getClubNum() + " , memberNum : " + vo.getMemberNum());
			for (int i = 0; i < clubNumArr.length; i++) {
				vo.setClubNum(Integer.parseInt(clubNumArr[i]));
				if (applyService.checkApplyClub(vo) == null) {
					applyService.applyFreeClub(vo);
					System.out.println("값 디비로 들어갔다~!");
					msg = "모임 신청이 완료되었습니다.";
				} else {
					System.out.println("이미 참여중인 모임이 있습니다.");
					msg = "이미 참여중인 모임이 있습니다.";
				}
			} // for문 end
		} else {
			System.out.println("찜한 모임이 없습니다!");
			msg = "찜한 모임이 없습니다!";
		} // 부모if 문 end
		return msg;
	}

	@RequestMapping("/applyPayClub")//.do뺌
	public String applyPayClub(ApplyVO vo, Model model, HttpServletRequest request) {
		System.out.println("************************** applyPayClub.do ****************************");
		System.out.println(" vo.getMemberNum() 확인" +  vo.getMemberNum());
		String clubNumArrStr[] = request.getParameter("clubNumArr").split(",");
		int clubNumArr[] = Arrays.stream(clubNumArrStr).mapToInt(Integer::parseInt).toArray();
		vo.setClubNumArr(clubNumArr);
		List<ApplyVO> list = applyService.applyPayClubInfo(vo);
		model.addAttribute("list", list);
		model.addAttribute("clubNumArr", request.getParameter("clubNumArr"));
		model.addAttribute("checkApplyClub", applyService.checkApplyClubByMemberNum(vo));
		System.out.println("ddddd여기 다시 서버 켜서 찍히는지 확인하기 ");
		return "mypage/heart/applyPayClub";
	}

	@RequestMapping("/applyPayClubPayment")
	public String applyPayClubPayment(ApplyVO vo, MemberVO mvo, PaymentVO pvo, Model model,HttpSession session, HttpServletRequest request) {
		String msg ="";
		System.out.println("************************** applyPayClubPayment****************************");

		MemberVO user = (MemberVO) session.getAttribute("user");
		mvo.setMemberNum(user.getMemberNum());
		
		System.out.println("리퀘스트 값 뽑아보기 : " + request.getParameter("clubNumArr").split(","));
		String clubNumArrStr[] = request.getParameter("clubNumArr").split(",");
		System.out.println("clubNumArr값 확인하기 : " + Arrays.toString(clubNumArrStr));// 배열에 콤마로 구분되어 들어간다.

		int clubNumArr[] = Arrays.stream(clubNumArrStr).mapToInt(Integer::parseInt).toArray();

		System.out.println("club 값 확인하기 : " + Arrays.toString(clubNumArr));
		System.out.println("getTotalFee : " + vo.getTotalFee());
		int totalFee = vo.getTotalFee();

		System.out.println("멤버값 확인하기 : " + mvo.getMemberNum() + "*********&&");
		mvo.setMemberPoint(totalFee);
		int currentPoint = memberService.selectMemberPoint(mvo); //보유 포인트 

		if (clubNumArrStr != null) {
			if ((currentPoint == 0) || ((currentPoint - totalFee) < 0)) {
				System.out.println("포인트가 부족합니다.");
				msg = "포인트가 부족합니다. 마이페이지에서 포인트 충전 가능합니다.";
			} else {
				// 포인트 부족하지 않으면 모임을 신청하고
				pvo.setMemberPoint((currentPoint - totalFee));
				pvo.setPayAmount(vo.getTotalFee());
				for (int i : clubNumArr) {
					System.out.println(i);
					vo.setClubNum(i);
					pvo.setClubNum(i);
					System.out.println( "클럽넘버 : " + pvo.getClubNum() + " / 클럽 비용  : " + pvo.getPayAmount());
					// 모임 신청 -apply 신청테이블에 정보 넣어주기
					applyService.applyFreeClub(vo); 
					// 참가자 payment 추가시킨다. 
					paymentService.useMemberPoint(pvo);	
					// 모임장 포인트를 10% 떼고 증가시킨다. 3 
					ClubVO cvo = new ClubVO(); // 값 중복 될까봐 
					cvo.setClubNum(i);
					String clubLeader = clubService.selectClub(cvo).getClubLeader();
					System.out.println("clubLeader : " + clubLeader);
					int clubFee = clubService.selectClub(cvo).getClubFee();
					int insertFee = (int)clubFee - (clubFee * 10 / 100);
					MemberVO memberVo = new MemberVO();
					memberVo.setMemberNickname(clubLeader);
					int clubLeaderCurrentPoint = memberService.selectMemberPointByNickname(memberVo);
					memberVo.setMemberPoint(clubLeaderCurrentPoint + insertFee);
					memberService.updateClubLeaderPoint(memberVo);
					// 관리자한테 10% 적립
					MemberVO adminMemberVo = new MemberVO();
					adminMemberVo.setMemberNickname("관리자");
					adminMemberVo.setMemberPoint((int) clubFee * 10 / 100);
					memberService.updateClubLeaderPoint(adminMemberVo);
				}// for문 end 
				mvo.setMemberPoint((currentPoint - totalFee));
				memberService.deductMemberPoint(mvo);
				msg = "모임 신청이 완료되었습니다. 마이페이지에서 확인하세요.";
			}
		}
		model.addAttribute("msg", msg);
		return "forward:/getHeartList"; 
	}
	
	@RequestMapping(value = "/insertHeart", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String insertHeart(HeartVO vo ,ClubVO cvo,Model model , HttpServletRequest request) {
		System.out.println("************************** insertHeart.do ****************************");
		System.out.print(vo.getMemberNum()+ "  \"멤버 넘버\" ");
		System.out.print(vo.getClubNum()+ "  \"클럽 넘버\" ");
		System.out.print(vo.getClubName()+ "  \"클럽 이름\" ");
		
		heartService.insertHeart(vo);
		clubService.plusHeartCnt(cvo);
		System.out.println("찜목록추가완료.. view..");
		return "찜하기 완료! 찜목록에서 확인해보세요❤";
	}

	//배열 찜목록 삭제 
	@RequestMapping(value = "/deleteHeart", produces = "application/text;charset=UTF-8") //.do뺌
	@ResponseBody
	public String deleteHeart(HeartVO vo ,Model model , HttpServletRequest request) {
		System.out.println("************************** deleteHeart.do ****************************");
		vo.setMemberNum(5);
		String[] clubNumArr = request.getParameterValues("clubNumArr");
		System.out.println(clubNumArr.length);
		int clubNumArrInt[] = Arrays.stream(clubNumArr).mapToInt(Integer::parseInt).toArray();
		System.out.println(clubNumArr.length);
		for (int i : clubNumArrInt) {
			vo.setClubNum(i);
			System.out.println("vooooo: " +vo.getClubNum());
			heartService.deleteHeart(vo);
		}
		return "찜목록에서 삭제 되었습니다.";
	}
	
	//단일 찜목록 삭제 
	@RequestMapping(value = "/deleteHeartOne", produces = "application/text;charset=UTF-8")
	@ResponseBody
	public String deleteHeartOne(HeartVO vo,ClubVO cvo ,Model model , HttpServletRequest request) {
		System.out.println("************************** deleteHeartOne.do ****************************");
		System.out.print(vo.getMemberNum()+ "  \"멤버 넘버\" ");
		System.out.print(vo.getClubNum()+ "  \"클럽 넘버\" ");
		heartService.deleteHeart(vo);
		clubService.minusHeartCnt(cvo);
		return "찜목록에서 삭제 되었습니다.💌";
	}
	
	
}
