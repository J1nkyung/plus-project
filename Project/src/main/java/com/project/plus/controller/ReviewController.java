package com.project.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.ReviewVO;
import com.project.plus.service.ClubService;
import com.project.plus.service.ReviewService;


@Controller
@SessionAttributes("review") 
public class ReviewController {
	
	@Autowired 
	private ReviewService reviewService;	 
	@Autowired 
	private ClubService clubService;	 

	
	@RequestMapping("/getReviewList")
	public String getReviewList(ReviewVO vo, Model model) {
		vo.setMemberNum(5);
		model.addAttribute("selectNotReview", reviewService.selectNotReview(vo)); 
		model.addAttribute("selectOkayReview", reviewService.selectOkayReview(vo)); 
		
		return "reviewList.reviews";
	}
	
	@RequestMapping("/showReviewForm") 
	public String showReviewForm(ClubVO cvo,ReviewVO vo, Model model) {
		System.out.println("******showReviewForm.do ReviewVO 넘버확인 ******" + vo.getMemberNum() + "**임시 회원번호에필요한 vo**");
		System.out.println("******showReviewForm.do ClubVO넘버확인 ******" + cvo.getClubNum());
		model.addAttribute("selectMember", vo.getMemberNum());
		model.addAttribute("selectClub", clubService.selectClub(cvo));
		System.out.println("getter 확인" + cvo.getClubNum());
		System.out.println("showReviewForm.do 성공! view로 이동..");
		
		return "createReview.reviews"; // .jsp는 미리 설정해둠. 
	}
	
	
	@RequestMapping("/writeReview.do") // 모임 값 꺼내는 컨트롤러 
	public String writeReview(ReviewVO vo, Model model) {
		System.out.println("vo.setMemberNum(5)	 넘버 확인 ***** " + vo.getMemberNum());
		System.out.println("vo.setClubNum(14) 넘버 확인 ***** " + vo.getClubNum());
		reviewService.insertReview(vo);

		return "redirect:getReviewList";
	}
	
	@RequestMapping("/readReview") 
	public String readReview(ClubVO cvo,ReviewVO vo, Model model) {
		System.out.println("******showReviewForm.do ReviewVO 넘버확인 ******"+vo.getClubNum()+"/" + vo.getMemberNum() + "**임시 회원번호에필요한 vo**");
		System.out.println("******showReviewForm.do ClubVO넘버확인 ******" + cvo.getClubNum());
		model.addAttribute("selectClub", clubService.selectClub(cvo));
		System.out.println("getter 확인" + cvo.getClubNum());
		System.out.println("showReviewForm.do 성공!");
		model.addAttribute("readReview", reviewService.readReview(vo));
		System.out.println("readReview도 완료!view로 이동..");
		
		return "updateReview.reviews"; // .jsp는 미리 설정해둠. 
	}
	@RequestMapping("/updateReview")
	public String updateReview(ReviewVO rvo , ClubVO cvo ,Model model) {
		System.out.println("******showReviewForm.do ReviewVO 넘버확인 ******"+rvo.getClubNum()+"/" + rvo.getMemberNum() + "**임시 회원번호에필요한 vo**");
		System.out.println("******showReviewForm.do ClubVO넘버확인 ******" + cvo.getClubNum());
		reviewService.updateReview(rvo);
		System.out.println("리뷰 업뎃완료!! .. 목록 view로 이동..");
		model.addAttribute("msg", "리뷰가 수정되었습니다!"); 

		return "redirect:getReviewList";
	}
	
	@RequestMapping("/deleteReview")
	public String deleteReview(ReviewVO rvo , ClubVO cvo ,Model model) {
		System.out.println("******showReviewForm.do ReviewVO 넘버확인 ******"+rvo.getClubNum()+"/" + rvo.getMemberNum() + "**임시 회원번호에필요한 vo**");
		System.out.println("******showReviewForm.do ClubVO넘버확인 ******" + cvo.getClubNum());
		reviewService.deleteReview(rvo);
		System.out.println("리뷰 삭제완료!! .. 목록 view로 이동..");
		model.addAttribute("msg", "리뷰가 삭제되었습니다!"); 

		return "redirect:getReviewList";
	}
}




