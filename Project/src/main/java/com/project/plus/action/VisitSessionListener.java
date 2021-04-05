package com.project.plus.action;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.plus.service.VisitCountService;

@Component
public class VisitSessionListener implements HttpSessionListener {
// ë°©ë¬¸??ˆ˜ë¥? ê³„ì‚°?•˜?Š” ?´?˜?Š¤

	@Override
	public void sessionCreated(HttpSessionEvent sessionEve) {
		System.out.println("?„¸?…˜ ?¬ë¦¬ì—?´?‹°?“œ ? ‘?†");
		// ?„¸?…˜?´ ?ƒˆë¡? ?ƒ?„±?˜ë©? execute() ?‹¤?–‰?•œ?‹¤.
		if (sessionEve.getSession().isNew()) {
			System.out.println("?„¸?…˜?‹¤?–‰?˜?‹ˆ?");
			execute(sessionEve);
		}
	}

	@Autowired
	VisitCountService vcs;

	int total = 0;
	int today = 0;

	private void execute(HttpSessionEvent sessionEve) {
		// VisitCountController cntr = VisitCountController.getInstance();
		System.out.println("execute ?‹¤?–‰?˜?—ˆ?‹ˆ?");
		total = vcs.getTotalCount();
		today = vcs.getTodayCount();

		try {

			System.out.println(total);
			System.out.println(today);
			HttpSession session = sessionEve.getSession();

//	            // ?„¸?…˜?— ë°©ë¬¸? ?ˆ˜ë¥? ?‹´?Š”?‹¤.
			session.setAttribute("total", total);
			session.setAttribute("today", today);

		} catch (Exception e) {
			System.out.println("===== ë°©ë¬¸? ì¹´ìš´?„° ?˜¤ë¥? =====\n");
			e.printStackTrace();
		}
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
	}

}
