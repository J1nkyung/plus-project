<<<<<<< HEAD
package com.project.plus.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.mapper.VisitCountMapper;
import com.project.plus.service.VisitCountService;

@Service
public class VisitCountServiceImpl implements VisitCountService {

	@Autowired
	VisitCountMapper mapper;
	
	public void setTotalCount() {
		mapper.setTotalCount();
	}

	@Override
	public int getTotalCount() {
		return mapper.getTotalCount();
		
	}

	@Override
	public int getTodayCount() {
		return mapper.getTodayCount();
	}

}
=======
package com.project.plus.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.mapper.VisitCountMapper;
import com.project.plus.service.VisitCountService;

@Service
public class VisitCountServiceImpl implements VisitCountService {

   @Autowired
   VisitCountMapper mapper;
   
   public void setTotalCount() {
      mapper.setTotalCount();
   }

   @Override
   public int getTotalCount() {
      return mapper.getTotalCount();
      
   }

   @Override
   public int getTodayCount() {
      return mapper.getTodayCount();
   }

}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
