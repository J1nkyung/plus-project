<<<<<<< HEAD
package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.domain.MemberVO;

public interface AnnounceService {
	
	void insertAnnounce(AnnounceVO vo);
	void updateAnnounce(AnnounceVO vo);
	void deleteAnnounce(AnnounceVO vo);
	AnnounceVO getAnnounce(AnnounceVO vo);
	List<AnnounceVO> getAnnounceList(AnnounceVO vo);
	Object getAnnounceList(AnnounceVO vo, MemberVO user);
	AnnounceVO updateForm(AnnounceVO vo);
}
=======
package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.domain.MemberVO;

public interface AnnounceService {
	
	void insertAnnounce(AnnounceVO vo);
	void updateAnnounce(AnnounceVO vo);
	void deleteAnnounce(AnnounceVO vo);
	AnnounceVO getAnnounce(AnnounceVO vo);
	List<AnnounceVO> getAnnounceList(AnnounceVO vo);
	Object getAnnounceList(AnnounceVO vo, MemberVO user);
	AnnounceVO updateForm(AnnounceVO vo);
}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
