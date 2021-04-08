package com.project.plus.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.plus.domain.ApplyVO;
import com.project.plus.domain.ClubVO;
import com.project.plus.domain.HeartVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PaymentVO;
import com.project.plus.domain.ReviewVO;
import com.project.plus.service.ApplyService;
import com.project.plus.service.ClubService;
import com.project.plus.service.HeartService;
import com.project.plus.service.MemberService;
import com.project.plus.service.PaymentService;
import com.project.plus.service.ReviewService;
import com.project.plus.utils.FileUtils;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class ClubController {
	
	@Autowired
	private ClubService clubService;

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private HeartService heartService;
	
	// 20210405 memberService 정연추가
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ApplyService applyService;
	
	@Autowired
	private PaymentService paymentService;
	// 20210405 여기 위까지 추가 
	
	@GetMapping("/clubForm")
	public String getClubForm() {
		return "clubForm.club";
	}
	

	// 모임 등록, 파일 업로드
	@RequestMapping(value = "/insertClub", method = RequestMethod.POST)
	public String insertClub(ClubVO vo, @RequestParam("upload") MultipartFile[] file, HttpServletRequest request)
			throws Exception {

		// 파일을 저장할 절대 경로 지정
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		vo = FileUtils.uploadFile(vo, uploadPath, file);
		clubService.insertClub(vo); // DB에 저장
		log.info("모임 번호 : " + vo.getClubNum() + " 등록 완료 ");
		log.info(uploadPath);
		return "redirect:main";

	}

	// 모임 수정  
	@RequestMapping("/updateClub")
	public String updateClub(ClubVO vo, @RequestParam("upload") MultipartFile[] file, HttpServletRequest request)
			throws Exception {
		System.out.println(vo.getClubShutDate());
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
		log.info(uploadPath);
		vo = FileUtils.uploadFile(vo, uploadPath, file);
		clubService.updateClub(vo);
		log.info("모임 번호 : " + vo.getClubNum() + " 수정 완료 ");

		return "redirect:main";
	}


	
	// json을 이용하여 더보기 리뷰 리스트 가져오기
	// produces : response의 content-type을 utf-8로 인코딩하여 보내기
	@RequestMapping(value = "/getMoreReview", produces = "application/text;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String getMoreReviews(@RequestBody Map<String, String> param) throws JsonProcessingException {
		
		
		Map<String, Integer> condition = new HashMap<String, Integer>();

		// json string으로 들어온 파라미터 형변환
		int startIndex = Integer.valueOf(param.get("startIndex").toString());
		int clubNum = Integer.valueOf(param.get("clubNum").toString());
		
		
		log.info("start index : " + startIndex);
		log.info("리뷰 더 가져오기 : " + clubNum);
		
		condition.put("startIndex", startIndex);
		condition.put("clubNum", clubNum);

		List<ReviewVO> newList = reviewService.getMoreReviews(condition);

		// java object -> json
		ObjectMapper mapper = new ObjectMapper();
		String jsonString = mapper.writeValueAsString(newList);
		return jsonString;

	}

	// 모임 상세정보 
	@RequestMapping("/getClub")
	public String getClub(@RequestParam("clubNum") int clubNum, ApplyVO avo, HeartVO hvo, HttpSession session, Model model) {
		
		//정연 추가 20210405
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user != null) {
			hvo.setMemberNum(user.getMemberNum());
		}
		model.addAttribute("tags", clubService.getClubHashtag(clubNum));
		System.out.println("heart" + hvo.getClubNum() +" " +  hvo.getMemberNum());
		int resultClub = heartService.selectHeartNum(hvo);
		model.addAttribute("isThereHeart", resultClub);
		avo.setClubNum(clubNum);
		int result = clubService.getOneApply(avo);
		
		/*이미 신청한 모임인지 아닌지 getClub jsp에서 확인 이거 사용 안할 듯 ,, */
		if(result==1) {
			model.addAttribute("yesNo", 1);
		} else {
			model.addAttribute("yesNo", 0);
		}
		// 2021045  여기위 까지
		
		// 미리 보여줄 5개 리뷰 
		model.addAttribute("reviews", reviewService.getReviews(clubNum));
		// 리뷰 총 개수 
		model.addAttribute("reviewCount", reviewService.getReviewCount(clubNum));
		// 모임 정보 
		model.addAttribute("club", clubService.getClub(clubNum));
		log.info("모임 번호 : " + clubNum+ " 상세 정보 ");
		return "getClub.club";
	}

	// 회원 모임 수정 폼 
	@RequestMapping("/getMyClubInfo")
	public String getMyClubInfo(@RequestParam("clubNum") int clubNum, ClubVO vo, Model model) {
		vo = clubService.getMyClubInfo(clubNum);

		// 경로를 자르고 파일명+확장자만 set
		if (vo.getClubMain_pic() != null) {
			String formatName = vo.getClubMain_pic().substring(vo.getClubMain_pic().lastIndexOf("_") + 1);
			vo.setClubMain_pic(formatName);
		}

		if (vo.getClubContent1_pic() != null) {
			String formatName = vo.getClubMain_pic().substring(vo.getClubContent1_pic().lastIndexOf("_") + 1);
			vo.setClubMain_pic(formatName);
		}

		if (vo.getClubContent2_pic() != null) {
			String formatName = vo.getClubMain_pic().substring(vo.getClubContent2_pic().lastIndexOf("_") + 1);
			vo.setClubMain_pic(formatName);
		}

		model.addAttribute("club", vo);
		log.info("모임 수정 폼 : " + vo.getClubNum());
		return "myClubInfo.club";
	}

	@RequestMapping("/deleteClub")
	public String deleteClub(ClubVO vo) {
		clubService.deleteClub(vo);
		log.info("모임 번호 : " + vo.getClubNum() + " 삭제 완료 ");
		return "redirect:main.do";
	}
	
	@RequestMapping("/apply")
	@ResponseBody
	public int apply(ApplyVO apply) {
		log.info("신청할 모임 번호 : " + apply.getClubNum());
		log.info("신청할 회원 번호 : " + apply.getMemberNum());
		
		// 모임에 신청하는 회원이 이미 신청을 했는지 확인
		int result = clubService.getOneApply(apply);
		
		if(result==1) {
			return 0;
		} else {
			// 없다면 insert 
			clubService.apply(apply);
			return 1;
		}
	}	
	
	@RequestMapping("/plusCurnum")
	@ResponseBody
	public int plusCurnum(@RequestParam("clubNum") int clubNum) {
		int result = clubService.plusCurnum(clubNum);
		log.info("참여인원수 증가 업데이트");
		
		if(result==1) {
			return 1;
		} else {
			return 0;
		}
	}
	
	// 수정하기 폼 임시로 설정
	@GetMapping("/myClubInfo")
	public String getInfo() {
		return "club/myClubInfo";
	}
	
	//20210403 정연추가 현재모임현황페이지
		@RequestMapping("/getCurrentClubList")
		public String getCurrentClubList(ClubVO vo, Model model, HttpSession session) {
			System.out.println("컨트롤러 입성 ~! ");
			
			MemberVO user = (MemberVO) session.getAttribute("user");
			if (user != null) {
				vo.setClubLeader(user.getMemberNickname());
			}
			
			int milli_seconds_per_day = 24 * 60 * 60 * 1000; // 하루 세기
			
			//개설한 모임
			List<ClubVO> list = clubService.selectCurClubList(vo);
			List<ClubVO> result = new ArrayList<>(); // 새로하나 만들고 담는다 
			if (list.size() > 0) {
				for (ClubVO cvo : list) {
					long percent = 0; // 아래 compare 했을 때 기준 값 보다 작으면 0 % 이다. 
					Date startDate = cvo.getClubStartDate();
					Date endDate = cvo.getClubEndDate();
					Date today = new Date(); // 오늘 날짜 
					int compare = today.compareTo(startDate); // [기준값.compareTo( 비교대상 )] -> 기준 값이 비교대상 보다 큰 경우 1
					if (compare > 0) {
						long top = (today.getTime() - startDate.getTime()) / milli_seconds_per_day + 1;
						long bottom = (endDate.getTime() - startDate.getTime()) / milli_seconds_per_day + 1;
						percent = (top * 100) / bottom ;
						System.out.println("top : " + top + ", bottom : " + bottom + ", percent : " + percent);
					}
					cvo.setProgressBar((int)percent);
					System.out.println(cvo.getClubName() + " : " + percent);
					result.add(cvo);
				}
			}
			model.addAttribute("selectCurClubList", result);
			
			//참여중인 모임 
			vo.setMemberNum(user.getMemberNum());
			
			int milli_seconds_per_days = 24 * 60 * 60 * 1000; // 하루 세기
			List<ClubVO> attendList = clubService.selectAttendClubList(vo);
			List<ClubVO> resultTwo = new ArrayList<>();
			if (attendList.size() > 0) {
				for (ClubVO cvoTwo : attendList) {
					long percent = 0; // 아래 compareTo 했을 때 기준 값 보다 작으면 0 % 이다. 
					Date startDate = cvoTwo.getClubStartDate();
					System.out.println("***********" + cvoTwo.getClubStartDate());
					Date endDate = cvoTwo.getClubEndDate();
					Date today = new Date(); // 오늘 날짜 
					int compare = today.compareTo(startDate); // [기준값.compareTo( 비교대상 )] -> 기준 값이 비교대상 보다 큰 경우 1
					if (compare > 0) {
						long top = (today.getTime() - startDate.getTime()) / milli_seconds_per_days + 1;
						long bottom = (endDate.getTime() - startDate.getTime()) / milli_seconds_per_days + 1;
						percent = (top * 100) / bottom ;
						System.out.println("top : " + top + ", bottom : " + bottom + ", percent : " + percent);
					}
					cvoTwo.setProgressBar((int)percent);
					System.out.println(cvoTwo.getClubName() + " : " + percent);
					resultTwo.add(cvoTwo);
				}
			}
			model.addAttribute("selectAttendClubList", resultTwo);
			
			int clubCnt = clubService.clubCnt(vo);
			model.addAttribute("clubCnt", clubCnt);
			
			return "currentClubList.curClub";
		}
		@RequestMapping("/extendDate")
		public String extentDate(ClubVO vo, Model model) throws ParseException {
			System.out.println("몇 일 연장이죠? : " + vo.getWeeks() + "클럽 번호 : " + vo.getClubNum());
			Date dt = new Date();
			dt = vo.getClubEndDate();
			int extendsdays = vo.getWeeks();
			Calendar cal = Calendar.getInstance ( ); 
			cal.setTime ( dt ); //Date 타입 Calendar타입으로 매핑
	        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	        System.out.println("연장 마감일 : " + df.format(cal.getTime()));
	        cal.add(Calendar.DATE, extendsdays);
	        System.out.println("after: " + df.format(cal.getTime()));
	        String dtt = df.format(cal.getTime()); // Date(long date)
	        java.sql.Date d = java.sql.Date.valueOf(dtt);
	        vo.setClubEndDate(d);
			System.out.println("값확인해봐라,,, "+vo.getClubEndDate());
	        clubService.updateEndDate(vo);
			return "redirect:/getCurrentClubList";
		}
		
		@RequestMapping(value = "/outClub", produces = "application/text;charset=UTF-8")
		@ResponseBody
		public String outClub(ClubVO vo , MemberVO mvo, Model model, HttpSession session, HttpServletRequest request) {
			String  chkmsg= "";
			System.out.println("나가기 컨트롤러" + " / clubNum : " + vo.getClubNum() + " clubLeader  / " + vo.getClubLeader());
			
			ClubVO cvo = clubService.clubOut(vo);
			MemberVO user = (MemberVO) session.getAttribute("user");
			if (user != null) {
				cvo.setMemberNum(user.getMemberNum());
				mvo.setMemberNum(user.getMemberNum());
			}
			System.out.println("유저번호 확인 " + " / " + cvo.getMemberNum() + " / " + mvo.getMemberNum() + " / ");
			System.out.println("클럽 아웃 쿼리문 값 확인 / " + cvo);
			
			//날짜에 따라 모임 취소 
			java.sql.Date today = new java.sql.Date(new java.util.Date().getTime()); // 오늘 날짜
			Date startDate = cvo.getClubStartDate();
			Date endDate = cvo.getClubEndDate();
			int compare = today.compareTo(startDate); // [기준값.compareTo( 비교대상 )] -> 기준 값이 비교대상 보다 큰 경우 1
			System.out.println("시작 : " + startDate + "끝 : " + endDate + "compare : " + compare);
			if (compare > 0) {	
				int minusCurNum = cvo.getClubCurnum() - 1;// 클럽 인원수 줄임 
				cvo.setClubCurnum(minusCurNum);// 클럽에서 나옴 
				clubService.updateClubCurNum(cvo);
				clubService.deleteApplyClub(cvo);
				if(cvo.getClubFee() == 0){
				System.out.println("시작 날짜가 지나 포인트 환불이 불가합니다.");
				chkmsg = "모임탈퇴가 완료되였습니다.";
				}else if (cvo.getClubFee() > 0) {
					System.out.println("시작 날짜가 지나 포인트 환불은 불가합니다.");
					chkmsg = "모임탈퇴가 완료되였습니다.";
				}
			}else {
				// 클럽 인원수 줄이고 신청목록에서 빼기
				int minusCurNum = cvo.getClubCurnum() - 1;// 클럽 인원수 줄임 
				cvo.setClubCurnum(minusCurNum);// 클럽에서 나옴 
				clubService.updateClubCurNum(cvo);
				clubService.deleteApplyClub(cvo);	
				
				if(cvo.getClubFee() == 0) {
					chkmsg = "모임탈퇴가 완료되였습니다.";
				}else if (cvo.getClubFee() > 0) {
					// 클럽에서 나온 멤버 환불 처리 
					int curPoint = memberService.selectMemberPoint(mvo); // 현재포인트 출력(현금 환불)
					int clubFee = cvo.getClubFee();
					int totalRefund = curPoint + clubFee; //현재금액에 환불금 더하기
					mvo.setMemberPoint(totalRefund);
					memberService.refundFee(mvo);
					// 클럽 모임장 금액 회수 
//					mvo.setMemberNickname("직장의신");
					MemberVO mvoTwo = new MemberVO();
					mvoTwo.setMemberNickname(vo.getClubLeader());
					int deductPercent = (int) (clubFee - (clubFee * 0.1));
					int clubLeaderPoint = memberService.selectMemberPointByNickname(mvoTwo);
					int currentLeaderPoint = clubLeaderPoint -deductPercent;
					mvoTwo.setMemberPoint(currentLeaderPoint); 
					memberService.updateClubLeaderPoint(mvoTwo);
					System.out.println("모임개설장 닉네임 / " + mvoTwo.getMemberNickname());
					chkmsg ="포인트 환불과 함께 모임탈퇴가 완료되였습니다.";
				}
			}
			return chkmsg;
		}
		   //결제 
		@RequestMapping("/payClub")
		public String payClub(ClubVO cvo,ApplyVO avo, Model model, HttpServletRequest request) {
			System.out.println("********************** payClub 컨트롤러 입성 ************************");
			System.out.println(cvo.getClubNum());
			System.out.println(avo.getClubNum());
			
//			Integer result = clubService.getOneApply(avo);
//			/*이미 신청한 모임인지 아닌지 getClub jsp에서 확인*/
//			String rst = "";
//			if(result != null) {
//				rst =  "forward:/getClub";
//				model.addAttribute("yesNo", "이미 참여중인 모임입니다.");
//				System.out.println("이미 있다 ");
//			} else {
//				rst = "club/payClub"; 
				
				System.out.println("없다 ");
				ClubVO cvoSend = clubService.selectClub(cvo);
				model.addAttribute("cvoSend", cvoSend);
			return "club/payClub"; 
		}
		
		@RequestMapping("/applyOnePayClubPayment")
		public String applyOnePayClubPayment(ApplyVO vo, MemberVO mvo, PaymentVO pvo, Model model, HttpServletRequest request) {
			String msg ="";
			System.out.println("************************** applyOnePayClubPayment.컨틀로럴 입성 ****************************");
			System.out.println(vo.getClubNum() + " / " + vo.getMemberNum() + " / ");
			System.out.println(pvo.getClubNum() + " / " + pvo.getMemberNum() + " / ");
			System.out.println(request.getParameter("clubLeader"));
			String clubLeader = request.getParameter("clubLeader");
 			int totalFee = vo.getTotalFee();
			System.out.println("토탈 피 : " + totalFee + "  현재 멤버 : " + mvo.getMemberNum());
			int currentPoint = memberService.selectMemberPoint(mvo); //보유 포인트 
			System.out.println("현재 멤버가 가진 돈 : " + currentPoint);
			Integer clubNumm = vo.getClubNum();
			
			if (clubNumm != null  ) {
				if ((currentPoint == 0) || ((currentPoint - totalFee) < 0)) {
					System.out.println("포인트가 부족합니다.");
					msg = "포인트가 부족합니다. 마이페이지에서 포인트 충전 가능합니다.";
				} else {
					// 포인트 부족하지 않으면 모임을 신청하고
					pvo.setMemberPoint((currentPoint - totalFee)); // 700현재 - 300모임신청 = 400 뺀금액 
					pvo.setPayAmount( totalFee);
					// 참가자 payment 추가시킨다. 
					paymentService.useMemberPoint(pvo);	
					// 참가자 apply 추가시킨다 
					applyService.applyFreeClub(vo);
					// 모임장 포인트를 10% 떼고 등가시킨다. 3 
					ClubVO cvo = new ClubVO(); // 값 중복 될까봐 
					cvo.setClubLeader(request.getParameter("clubLeader")); //클럽 장 
					String cNum = request.getParameter("clubNum"); //클럽 장 
					cvo.setClubNum(Integer.parseInt(cNum));
					System.out.println("clubLeader!!!! : " + cvo.getClubLeader() + "클럽 넘버 : " + cvo.getClubNum());
					int clubFee = clubService.selectClub(cvo).getClubFee(); // 클럽  모임 참가비 추출 
					int insertFee = (int)clubFee - (clubFee * 10 / 100); // 참가비에서 10%를 뺀 금액 추출 
					MemberVO memberVo = new MemberVO(); // 모임장 용 
					memberVo.setMemberNickname(clubLeader);
					int clubLeaderCurrentPoint = memberService.selectMemberPointByNickname(memberVo); // 모임장 금액 더하기 전 현재 포인트 추출 
					memberVo.setMemberPoint(clubLeaderCurrentPoint + insertFee);
					memberService.updateClubLeaderPoint(memberVo);
					// 관리자한테 10% 적립
					MemberVO adminMemberVo = new MemberVO(); // 관리자용 
					adminMemberVo.setMemberNickname("관리자");
					adminMemberVo.setMemberPoint((int) clubFee * 10 / 100);
					memberService.updateClubLeaderPoint(adminMemberVo);
					
					// 참여자 포인트를 차감하고 2
					mvo.setMemberPoint((currentPoint - totalFee));
					memberService.deductMemberPoint(mvo);
					
					// 모임장 payment 추가시킨다. 
					PaymentVO pvoTwo = new PaymentVO(); // 모임장 용 
					int memberNumber = memberService.selectMemberNumberByNickname(memberVo);
					System.out.println("");
					pvoTwo.setMemberNum(memberNumber);// 리더명으로 쿼리문 짜서 멤버 넘버 추출하기 
					pvoTwo.setClubNum(vo.getClubNum());
					pvoTwo.setPayAmount(insertFee);
					paymentService.getClubPoint(pvoTwo);
					
					//클럽 참여자 수 증가 -- plusCurnum
					int result = clubService.plusCurnum(vo.getClubNum());
				
					System.out.println("result : " + result); // int 값 얼마나오는 지 확인 
					
					msg = "모임 신청이 완료되었습니다. 마이페이지에서 확인하세요.";
					}
				}
			model.addAttribute("msg", msg);
			return "forward:/getClub";
		}
		// 여기 위까지 추가 20210405 정연
}