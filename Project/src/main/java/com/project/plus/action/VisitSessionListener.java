package com.project.plus.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.plus.service.VisitCountService;

@Component
public class VisitSessionListener implements HttpSessionListener {
// 방문?��?���? 계산?��?�� ?��?��?��

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
	
		if (sessionEve.getSession().isNew()) {
			execute(sessionEve);
		}
	}

	@Autowired
	VisitCountService vcs;

	int total = 0;
	int today = 0;

	private void execute(HttpSessionEvent sessionEve) {
		// VisitCountController cntr = VisitCountController.getInstance();
//		total = vcs.getTotalCount();
//		today = vcs.getTodayCount();

		try {

//			System.out.println(total);
//			System.out.println(today);
			HttpSession session = sessionEve.getSession();


//			session.setAttribute("total", total);
//			session.setAttribute("today", today);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
	}

}
