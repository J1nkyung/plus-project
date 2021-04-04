package com.project.plus.controller;

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
import com.project.plus.domain.ReviewVO;
import com.project.plus.service.ClubService;
import com.project.plus.service.HeartService;
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
	public String getClub(@RequestParam("clubNum") int clubNum, HeartVO hvo, HttpSession session, Model model) {
		
		//정연 추가 20210401 
//		hvo.setClubNum(2); //20210401삭제
//		hvo.setMemberNum(3); //20210401삭
		MemberVO user = (MemberVO) session.getAttribute("user");
		if (user != null) {
			hvo.setMemberNum(user.getMemberNum());
		}
		model.addAttribute("tags", clubService.getClubHashtag(clubNum));
		System.out.println("heart" + hvo.getClubNum() +" " +  hvo.getMemberNum());
		int resultClub = heartService.selectHeartNum(hvo);
		model.addAttribute("isThereHeart", resultClub);
		//여기위 까지
		
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
	public String getMyClubInfo(ClubVO vo, Model model) {
		vo = clubService.getMyClubInfo(vo);

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
		return "club/myClubInfo.club";
	}
	
}