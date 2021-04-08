//package com.project.plus.controller;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//
//import com.project.plus.domain.VisitCountVO;
//import com.project.plus.service.VisitCountService;
//
//@Controller
//public class VisitCountController {
//private static VisitCountController instance;
//	
//	@Autowired
//	private VisitCountService vcs;
//	
//
//	// 싱글톤 패턴
////    private VisitCountController(){}
////    public static VisitCountController getInstance(){
////        if(instance==null)
////            instance=new VisitCountController();
////        return instance;
////    }
//	
//
//	public String getTotalCount(VisitCountVO vo, Model model) {
//		model.addAttribute("getTotalChart", vcs.getTotalCount(vo));
//		return "/include/footer";
//	}
//	
//	public String getTodayCount(VisitCountVO vo, Model model) {
//		model.addAttribute("getTodayCount", vcs.getTodayCount(vo));
//		return "/include/footer";
//	}
//	
//}
