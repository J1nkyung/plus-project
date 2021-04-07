<<<<<<< HEAD
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
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
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

<<<<<<< HEAD
}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
}
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
