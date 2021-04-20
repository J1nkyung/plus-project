package com.project.plus.controller;

import java.io.PrintWriter;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.project.plus.domain.MemberVO;
import com.project.plus.domain.PageMakerMem;
import com.project.plus.domain.SearchCriteriaMem;
import com.project.plus.service.MemberService;
import com.project.plus.utils.ProfileUtils;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@SessionAttributes("user")
public class MemberController {
   
   @Autowired
   private MemberService memberService;
   
   @Autowired
    private JavaMailSender mailSender;
   
   @Autowired
   BCryptPasswordEncoder pwdEncoder;



   @RequestMapping(value="memberJoin", method=RequestMethod.GET)
   public String memberjoinpage(MemberVO vo, HttpSession session, Model model) throws Exception {
      System.out.println("회원가입 get메서드 진입");
   return "memberJoin";
   }
   
 
   
   @RequestMapping(value="memberJoin", method=RequestMethod.POST)
   public String memberJoin(MemberVO vo, Model model, HttpSession session, HttpServletResponse response, @RequestParam("memberPhoto") MultipartFile file, HttpServletRequest request) throws Exception {
      
      
      //비밀번호 암호화
      String inputPass = vo.getMemberPassword();
      String memberPassword = pwdEncoder.encode(inputPass);
      vo.setMemberPassword(memberPassword);
      
      
      // 파일을 저장할 절대 경로 지정
      String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
      vo = ProfileUtils.profile(vo, uploadPath, file);
      memberService.joinMember(vo);
      System.out.println(vo);
      log.info("회원 번호 : " + vo.getMemberNum() + "멤버프로필사진  등록 ");
  
      session.setAttribute("user", null);
      session.removeAttribute("user");
      model.addAttribute("user", null); 
      
// 	 response.setContentType("text/html; charset=UTF-8");
//     PrintWriter out = response.getWriter();
//     out.println("<script>alert('회원가입이 완료되었습니다 '); </script>");
//     out.flush();
     
      return "redirect:login";
         
   }
   
   
   //휴대폰번호 중복검사 메서드
   @RequestMapping(value = "memberPhoneCheck", method = RequestMethod.POST)
   @ResponseBody public String memberPChk(String memberPhone) throws Exception{ 
      int result = memberService.memberPChk(memberPhone); 
      log.info("모바일 결과값 = " + result); 
      if(result != 0) { 
         return "fail"; // 중복 폰번호 존재
         } else { 
            return "success"; // 중복 폰번호 x 
         }
   }

       
   //닉네임 중복검사 메서드
   @RequestMapping(value = "memberNickCheck", method = RequestMethod.POST)
   @ResponseBody public String memberNickChk(String memberNickname) throws Exception{ 
      int result = memberService.memberNChk(memberNickname); 
      log.info("닉네임 결과값 = " + result); 
      if(result != 0) { 
         return "fail"; // 중복 닉네임이 존재 
         } else { 
            return "success"; // 중복 닉네임 x 
         }
   }
   //이메일 중복검사 메서드
   @RequestMapping(value = "memberEmailCheck", method = RequestMethod.POST)
   @ResponseBody public String memberEmailChk(String memberEmail) throws Exception{ 
	   int result = memberService.memberEChk(memberEmail); 
	   log.info("이메일 결과값 = " + result); 
	   if(result != 0) { 
		   return "fail"; // 중복 닉네임이 존재 
	   } else { 
		   return "success"; // 중복 닉네임 x 
	   }
   }
   
   
   
   //회원 목록 조회
   @RequestMapping(value="memberListPage", method=RequestMethod.GET)
   public String memberList(Model model, SearchCriteriaMem scmem) {
      System.out.println("memberListPage Get 진입");
      
      List<MemberVO> list = memberService.memberList(scmem);
     // System.out.println(list);
      model.addAttribute("list", list);
      
      PageMakerMem pmem = new PageMakerMem();
      pmem.setCriMem(scmem);
      pmem.setTotalCount(memberService.listCount(scmem));
      model.addAttribute("pmem", pmem);

      return "member/memberList";

   }
   
   //로그인하고 내정보확인 페이지 들어가면 정보 뿌려주는 메서드
   @RequestMapping(value="memberUpdate", method=RequestMethod.GET)
   public String memberUpdatepage(MemberVO vo, HttpSession session, Model model) throws Exception {
   System.out.println("memberUpdate get method");
   
   //MemberVO mInfo = memberService.selectMember(vo);  
    model.addAttribute("memberInfo", memberService.viewMember(vo.getMemberNum()));

   //model.addAttribute("memberInfo", vo);
   System.out.println("멤버업데이트 get메서드"+vo); //null나와 ... 
   System.out.println("memberInfo " + memberService.viewMember(vo.getMemberNum()));
   MemberVO user = (MemberVO) session.getAttribute("user"); //로그인한 사람의 정보 (세션에서 가져옴)

   
   if(user.getMemberNum() == 1) {
      
      return "member/memberUpdate";
      
    }else if(user.getMemberNum()!= 1) {
       
          return "memberUpdate.member";
    }

     return "";

   }

    
   //회원 정보 업데이트하는 메서드 
   @RequestMapping(value="memberUpdate", method=RequestMethod.POST)
   public String memberUpdate(MemberVO vo, HttpSession session, Model model, 
            HttpServletResponse response, @RequestParam("memberPhoto") MultipartFile file, 
            HttpServletRequest request) throws Exception {
      
      System.out.println("기본"+vo); //수정하려는 정보내용 
      String uploadPath = request.getSession().getServletContext().getRealPath("/resources/uploadImg");
      vo = ProfileUtils.profile(vo, uploadPath, file);
      memberService.updateMember(vo);
      MemberVO mInfo = memberService.selectMember(vo);  
      System.out.println("세션정보확인"+session.getAttribute("user")); //로그인한사람 정보, (사용자라면 원래정보)
      
      System.out.println("선택정보 vo user에 담음");
      System.out.println(mInfo); //수정후정보 
      
      
      MemberVO user = (MemberVO) session.getAttribute("user"); //로그인한 사람의 정보 (세션에서 가져옴)
      
      
         //헤더에 로그인한 유저의 닉네임을 표시하기 위한 코드 
         //세션정보에 따라 다르게 처리 - 
         //관리자가 회원 정보를 수정할 때 : memberNum == 1,
         //회원이 개인 정보를 수정할 때 : memberNum != 1 
         if(user.getMemberNum() == 1) {
            user = (MemberVO) session.getAttribute("user"); //로그인한 사람의 정보 (세션에서 가져옴)
//            return "memberListPage";
         }else if(user.getMemberNum()!= 1) {
            //새로운 정보들을 담기 위해서 세션값, 모델값을 한번 비워준다
            session.removeAttribute("user");//remove랑 invalidate랑 다름
            model.addAttribute("user", null); 
            
            //새로 넣어주는 단계
            //mInfo 에 담긴 정보를 user라는 키값으로 세션에 저장 
            session.setAttribute("user", mInfo);
            //memberUpdate 창에 정보를 표시하기 위해 memberInfo라는 키값으로 세션값을 저장
            model.addAttribute("memberInfo", session.getAttribute("user")); //정보 담았어 
            return "memberUpdate.member";
         }
      
      return "redirect:memberListPage";

   }
   
   
   //비밀번호 변경  get 메서드 
   @RequestMapping(value="changePw", method=RequestMethod.GET)
   public String changePwPage(MemberVO vo) throws Exception{
      return "changePw.member";
   }

   //비밀번호 변경 post 메서드 
   @RequestMapping(value="changePw", method=RequestMethod.POST)
   public String changePw(MemberVO vo, @RequestParam("ori_pswd")String ori_pswd, HttpSession session, HttpServletResponse response) throws Exception{
	  
	   
	   MemberVO user = (MemberVO) session.getAttribute("user");
	   System.out.println(user.getMemberEmail());
	
	   
	   Boolean pwdMatch = pwdEncoder.matches(ori_pswd, user.getMemberPassword());
	   System.out.println("ori_pswd확인" + ori_pswd); //예전 비밀번호 확인 
	   System.out.println(vo.getMemberPassword());//새로운 비밀번호 받아옴
		if(pwdMatch == true) {
			System.out.println("true 진입??"); //진입 완료 
		    
			String inputPass = vo.getMemberPassword();
		      String memberPassword = pwdEncoder.encode(inputPass);
		      
		      
		      //여기서 user의 정보에다가 새로운 암호를 set해주는거같아 
		      user.setMemberPassword(memberPassword); 
		      
		    //그래서 여기도 user인거..? 위의 정보로 비밀번호 바꿔줘야하니까
			memberService.changePw(user); 
			return "redirect:logout";
		}else {
			
			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            
	            out.println("<script>alert('비밀번호를 확인해주세요'); history.go(-1);</script>");
	            out.flush();
			return "changePw.member";
		}
   }

   
   
   
   @RequestMapping(value="memberDelete", method=RequestMethod.POST)
   public String delete(MemberVO vo) throws Exception{
	   memberService.deleteMember(vo.getMemberNum());
	   return "redirect:memberListPage";
   }
   
   
   //회원가입 시 인증메일 보내는 메서드
   @RequestMapping(value="mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
      System.out.println("메일함수 진입");
      
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        log.info("이메일 데이터 전송 확인");
        log.info("인증번호 : " + email);
        
        Random random = new Random();
        int checkNum = random.nextInt(888888);
        log.info("인증번호 " + checkNum);

        /* 이메일 보내기 */
        String setFrom = "plusprojectofficial@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "더하기를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

        try {
                  
                  MimeMessage message = mailSender.createMimeMessage();
                  MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
                  helper.setFrom(setFrom);
                  helper.setTo(toMail);
                  helper.setSubject(title);
                  helper.setText(content,true);
                  mailSender.send(message);
                  
              }catch(Exception e) {
                  e.printStackTrace();
              }

        String num = Integer.toString(checkNum);
        System.out.println(num);
        return num;
        
    }
 
   
   
}