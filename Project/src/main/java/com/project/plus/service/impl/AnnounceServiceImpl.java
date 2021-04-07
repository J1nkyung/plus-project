<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.AnnounceMapper;
import com.project.plus.service.AnnounceService;

@Service("AnnounceService")
public class AnnounceServiceImpl implements AnnounceService {

	@Autowired
	AnnounceMapper mapper;
	

	@Override
	public void insertAnnounce(AnnounceVO vo) {
		mapper.insertAnnounce(vo);	
	}
	@Override
	public void updateAnnounce(AnnounceVO vo) {
		mapper.updateAnnounce(vo);
	}
	@Override
	public void deleteAnnounce(AnnounceVO vo) {
		mapper.deleteAnnounce(vo);
	}

	@Override
	public AnnounceVO getAnnounce(AnnounceVO vo) {
		return mapper.getAnnounce(vo);
	}

	@Override
	public List<AnnounceVO> getAnnounceList(AnnounceVO vo) {
		return mapper.getAnnounceList(vo);
	}
	@Override
	public Object getAnnounceList(AnnounceVO vo, MemberVO user) {
		return mapper.getAnnounceList(vo);
	}
	@Override
	public AnnounceVO updateForm(AnnounceVO vo) {
		return mapper.getAnnounce(vo);
	}
	


}
<<<<<<< HEAD
=======
package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.AnnounceVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.AnnounceMapper;
import com.project.plus.service.AnnounceService;

@Service("AnnounceService")
public class AnnounceServiceImpl implements AnnounceService {

	@Autowired
	AnnounceMapper mapper;
	

	@Override
	public void insertAnnounce(AnnounceVO vo) {
		mapper.insertAnnounce(vo);	
	}
	@Override
	public void updateAnnounce(AnnounceVO vo) {
		mapper.updateAnnounce(vo);
	}
	@Override
	public void deleteAnnounce(AnnounceVO vo) {
		mapper.deleteAnnounce(vo);
	}

	@Override
	public AnnounceVO getAnnounce(AnnounceVO vo) {
		return mapper.getAnnounce(vo);
	}

	@Override
	public List<AnnounceVO> getAnnounceList(AnnounceVO vo) {
		return mapper.getAnnounceList(vo);
	}
	@Override
	public Object getAnnounceList(AnnounceVO vo, MemberVO user) {
		return mapper.getAnnounceList(vo);
	}
	@Override
	public AnnounceVO updateForm(AnnounceVO vo) {
		return mapper.getAnnounce(vo);
	}
	


}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
