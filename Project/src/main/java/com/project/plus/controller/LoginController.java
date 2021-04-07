package com.project.plus.controller;



import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.plus.domain.MemberVO;
import com.project.plus.service.MemberService;
import com.project.plus.service.impl.MemberServiceImpl;

import lombok.extern.log4j.Log4j;


@Controller
@SessionAttributes("user")
@Log4j
public class LoginController {

    @Autowired
	private MemberService memberService;

    //로그인 페이지 접속했을 때 연결
	@RequestMapping(value="login", method=RequestMethod.GET) 
	public String loginpage(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	
		return "login.login";

	}
	

	//로그인 버튼 클릭했을 때 실행되는 컨트롤러

	@RequestMapping(value="login", method=RequestMethod.POST) 
	public String login(MemberVO vo, HttpSession session, Model model, HttpServletResponse response) throws Exception {
	System.out.println("로그인 컨트롤러 접속");
		try {
			//로그인 성공했을 때
			MemberVO user = memberService.login(vo);
			session.setAttribute("user", user);
			model.addAttribute("userInfo", user);
			System.out.println(user.getMemberEmail());
			System.out.println(user.getMemberPassword());
			System.out.println(user.getMemberNum());
			System.out.println(user.getMemberNum());
			System.out.println(user + "일반로그인 유저정보 획득");
			return "redirect:main";
			
		} catch(Exception e) {
			e.printStackTrace();
			//로그인 실패했을 때
//			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
			System.out.println("로그인 실패");

			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
//	            out.println("<script>alert('로그인 정보를 확인해주세요.');location.href = '/login.jsp';</script>");

	            
	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
	            out.close();


			return "login.login";
		}
	}
	
	@ResponseBody 
	@RequestMapping(value="kakaologin", method=RequestMethod.POST) 
	public String kakaologin(MemberVO vo, HttpSession session) throws Exception {
	System.out.println("카카오 로그인 컨트롤러 접속");
		try {
			//로그인 성공했을 때
			
			System.out.println("카카오로그인시도중~"+vo);  //카카오 로그인시 vo 확인


			
			int result = memberService.kakaologin(vo);  //이거랑 카카오 로그인 할때 꼭 있어야돼.. 둘 다 있어야돼 .... 왠지는 몰라
			MemberVO user = vo;					//이거랑	
			
			System.out.println("카카오 로그인 거친 vo~"+ user);  //카카오 로그인시 vo 확인

			
			
			System.out.println(user.getMemberNum()+"membernum");
			//MemberVO user = vo;
			//MemberVO user = memberService.kakaologin(vo);
			
			System.out.println(user + "vo카카오");  //카카오 로그인시 vo 확인
			//MemberVO user = vo;
			System.out.println("user카카2"+user);
			
			log.info(vo.getMemberNum());
			
			if(result!=0) { 
				session.setAttribute("user", user);
				System.out.println("해봐라user " + user);
				System.out.println("해봐라"+vo);
				return "redirect:main";
			}else if(result==0) {
				session.setAttribute("user", user);
				System.out.println("이상한디?user" + user);
				return "memberJoin";
			}
			
//			session.setAttribute("user", vo);
//			System.out.println("카카오" + vo);
//			
			return "redirect:main";
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("카카오 로그인 실패");
			return "login";
		}
	}
	
	
	
	
	@RequestMapping(value="naverlogin", method=RequestMethod.GET) 
	public String naverlogin(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
	System.out.println("naver로그인 컨트롤러 접속");
	System.out.println(session+"1");

		try {
			
		System.out.println(session+"세션a2a");
			//로그인 성공했을 때
			MemberVO user = memberService.login(vo);
			session.setAttribute("user", user);
//			System.out.println(user.getMemberEmail());
//			System.out.println(user.getMemberPassword());
//			System.out.println(user.getMemberNum());
//			System.out.println(user.getMemberNum());
			System.out.println(user+" 세션에 넣은 유저");
			return "redirect:main";
			
		} catch(Exception e) {
			e.printStackTrace();
			//로그인 실패했을 때
			System.out.println("로그인 컨트롤러 네이버 로그인 실패");

			 response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();

	            System.out.println("naver로그인 실패");
	        	System.out.println(session+"a1123a");
	            out.println("<script>alert('네이버 로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
	            out.close();


			return "memberJoin";
		}
	}
	
	
	//로그아웃 컨트롤러(로그아웃은 jsp에서 실행)
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		MemberServiceImpl memberServiceImpl = new MemberServiceImpl();
		memberServiceImpl.logout(session);
		
		 //session.invalidate(); 
		 return "logout.login";
		 
	}
	
	

	


	

	
}
	
