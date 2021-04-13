package com.project.plus.controller;

import java.lang.reflect.Member;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.plus.domain.ClubVO;
import com.project.plus.domain.Criteria;
import com.project.plus.domain.MemberVO;
import com.project.plus.service.MainService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MainController {

   @Autowired
   private MainService service;


   
   @GetMapping("/main")
   public String mainList(Model model, ClubVO cvo, MemberVO mvo) {
   
      log.info("list(GET) - memberlatitude : " + mvo.getMemberLatitude());
      log.info("list(GET) - memberlongitude : " + mvo.getMemberLongitude());

      // GPS 정보가 없으면 gps.jsp 가서 정보를 가져온다.
      if (mvo.getMemberLatitude() == null || mvo.getMemberLongitude() == null) {
         log.info("list(GET) - gps(GET)으로 forward ");
         String kind = "main";
         return "redirect:main/gps?kind="+kind;
      }      
       
         model.addAttribute("main", service.getListBest(mvo));
         model.addAttribute("main2", service.getListDeadline(mvo));

         return "main/index";
         }
   
   @GetMapping("main/gps")
   //gps.jsp 가서 위도,경도만 반환받고 바로 expert 페이지로 다시 돌아간다.
   public void gps(MemberVO mvo, Model model, @RequestParam("kind") String kind ) {      
      log.info("gps(GET) ");      
      log.info("kind : " + kind);
      
      // kind 종류에 따라 구분
      if(kind.equals("main")) {
    	  model.addAttribute("gps", mvo );      
    	  model.addAttribute("kind", kind );      
    	  log.info(kind);
      } 
      else if(kind.equals("normal")) {
    	  model.addAttribute("gps", mvo );      
    	  model.addAttribute("kind", kind );      
    	  log.info(kind);
      }
      else if (kind.equals("expert")) {
    	  model.addAttribute("gps", mvo );      
    	  model.addAttribute("kind", kind );      
    	  log.info(kind); 
      }
   }
 }
			