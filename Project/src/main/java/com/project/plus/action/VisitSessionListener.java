package com.project.plus.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.plus.service.VisitCountService;

@Component
public class VisitSessionListener implements HttpSessionListener {
// 방문자수를 계산하는 클래스

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		System.out.println("세션 크리에이티드 접속");
		// 세션이 새로 생성되면 execute() 실행한다.
		if (sessionEve.getSession().isNew()) {
			System.out.println("세션실행되니?");
			execute(sessionEve);
		}
	}

	@Autowired
	VisitCountService vcs;

	int total = 0;
	int today = 0;

	private void execute(HttpSessionEvent sessionEve) {
		// VisitCountController cntr = VisitCountController.getInstance();
		System.out.println("execute 실행되었니?");
		total = vcs.getTotalCount();
		today = vcs.getTodayCount();

		try {

			System.out.println(total);
			System.out.println(today);
			HttpSession session = sessionEve.getSession();

//	            // 세션에 방문자 수를 담는다.
			session.setAttribute("total", total);
			session.setAttribute("today", today);

		} catch (Exception e) {
			System.out.println("===== 방문자 카운터 오류 =====\n");
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
	}

}
