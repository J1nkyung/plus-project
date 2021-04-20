package com.project.plus.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
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

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	// 로그인 페이지 접속했을 때 연결
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String loginpage(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {

		return "login.login";

	}

	// 로그인 버튼 클릭했을 때 실행되는 컨트롤러

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session, HttpServletRequest request, Model model,
			HttpServletResponse response) throws Exception {
		System.out.println("로그인 컨트롤러 접속");

		// 아이디 - 암호화된 비밀번호 일치 검사
		boolean pwdMatch;

		// remember me 체크 시 쿠키 저장 관련
		String saveId = request.getParameter("saveId");
		String memberEmail = request.getParameter("memberEmail");
		System.out.println("로그인 확인" + memberEmail);
		// try {
		// 로그인 성공했을 때
		MemberVO user = memberService.login(vo);

//			System.out.println(user.getMemberEmail());
//			System.out.println(user.getMemberPassword());
//			System.out.println(user.getMemberNum());
//			System.out.println(user + "일반로그인 유저정보 획득");

		// rememberMe 체크시
		if (saveId != null) {
			Cookie c = new Cookie("saveId", memberEmail);
			c.setMaxAge(60 * 60 * 24 * 7); // 7일간 저장
			response.addCookie(c);

			// 체크박스 해제시
		} else {
			Cookie c = new Cookie("saveId", memberEmail);
			c.setMaxAge(0);
			response.addCookie(c);
		}

		// db에 없는 이메일 입력했을 경우
		if (user != null) {
			pwdMatch = pwdEncoder.matches(vo.getMemberPassword(), user.getMemberPassword());

		} else {
			pwdMatch = false;
		}

		// db에 있는 이메일과 비밀번호 비교하는 경우
		if (user != null && pwdMatch == true) {
			session.setAttribute("user", user);
			model.addAttribute("userInfo", user);
			return "redirect:main";
		} else {
			session.setAttribute("user", null);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
			return "login.login";
		}

//		} catch(Exception e) {
//			e.printStackTrace();
//			//로그인 실패했을 때
////			session.setAttribute("errMsg", "로그인 정보가 올바르지 않습니다");
//			System.out.println("로그인 실패");
//
//			 response.setContentType("text/html; charset=UTF-8");
//	            PrintWriter out = response.getWriter();
////	            out.println("<script>alert('로그인 정보를 확인해주세요.');location.href = '/login.jsp';</script>");
//
//	            
//	            out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
////	            out.flush();
//	            out.close();
//
//
//			return "login.login";
//		}
	}

	@ResponseBody
	@RequestMapping(value = "kakaologin", method = RequestMethod.POST)
	public String kakaologin(MemberVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("카카오 로그인 컨트롤러 접속");
		try {
			// 로그인 성공했을 때
			int result = memberService.kakaologin(vo);
			System.out.println("result" + result);
			log.info(vo.getMemberNum());

			if (result == 1) {
				MemberVO user = memberService.login(vo);
				System.out.println("result1 진입 ");
				session.setAttribute("user", user);
				System.out.println(user);
				model.addAttribute("userInfo", user);

				return "redirect:main";
				//로그인 실패 할 경우
			} else if (result == 0) {
				MemberVO user = memberService.login(vo);
				session.setAttribute("user", user);
				System.out.println("이상한디?user" + user);
				return "memberJoin";
			}
			return "redirect:main";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("카카오 로그인 실패");
			return "login";
		}
	}

	@RequestMapping(value = "naverlogin", method = RequestMethod.GET)
	public String naverlogin(MemberVO vo, HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("naver로그인 컨트롤러 접속");
		System.out.println(session + "1");

		try {

			System.out.println(session + "세션a2a");
			// 로그인 성공했을 때
			MemberVO user = memberService.login(vo);
			session.setAttribute("user", user);
//			System.out.println(user.getMemberEmail());
//			System.out.println(user.getMemberPassword());
//			System.out.println(user.getMemberNum());
//			System.out.println(user.getMemberNum());
			System.out.println(user + " 세션에 넣은 유저");
			return "redirect:main";

		} catch (Exception e) {
			e.printStackTrace();
			// 로그인 실패했을 때
			System.out.println("로그인 컨트롤러 네이버 로그인 실패");

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			System.out.println("naver로그인 실패");
			System.out.println(session + "a1123a");
			out.println("<script>alert('네이버 로그인 정보를 확인해주세요.'); history.go(-1);</script>");
//	            out.flush();
			out.close();

			return "memberJoin";
		}
	}

	// 로그아웃 컨트롤러(로그아웃은 jsp에서 실행)
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		return "logout.login";
	}

	// 비밀번호 찾기 페이지 메서드
	@RequestMapping(value = "findPw", method = RequestMethod.GET)
	public String findPw() throws Exception {
		return "findPw.login";
	}

	@RequestMapping(value = "getPw", method = RequestMethod.POST)
	@ResponseBody
	public String getPw(MemberVO vo) throws IOException {
		MemberVO user = memberService.findPw(vo);
		String pw = user.getMemberPassword();
		String name = user.getMemberName();
		String email = user.getMemberEmail();

		// System.out.println("확인해보자"+pw + name+email);

		// 임시 비밀번호 생성
		String newPw = "";
		for (int i = 0; i < 12; i++) {
			newPw += (char) ((Math.random() * 26) + 97);
		}
		System.out.println("임시 비밀번호 확인" + newPw);

		String setFrom = "plusprojectofficial@gmail.com";
		String toMail = user.getMemberEmail();
		String title = name + "회원님의 비밀번호를 안내드립니다.";
		String content = "안녕하세요. 더하기입니다." + "<br><br><strong>" + name + "</strong> 회원님의 임시 비밀번호는 <strong>" + newPw
				+ "</strong> 입니다.<br>" + "로그인하신 후에는 비밀번호 변경을 부탁드립니다.<br>" + "<br><br>" + "더하기와 함께 더 가치있는 시간 보내시기 바랍니다.";

		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

			// 메일 전송 후 임시비밀번호 암호화 (이렇게 해야 로그인 가능)
			String encodeNewPw = pwdEncoder.encode(newPw);
			user.setMemberPassword(encodeNewPw);
			memberService.changePw(user);

			// String url =
			return "login.login";

		} catch (Exception e) {
			e.printStackTrace();

			return "redirect:login";
		}
	}

}
