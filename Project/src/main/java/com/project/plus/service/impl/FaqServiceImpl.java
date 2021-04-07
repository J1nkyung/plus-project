<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
package com.project.plus.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.FaqVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.service.FaqService;

@Service("FaqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqMapper mapper;

	@Override
	public void insertFaq(FaqVO vo) {
		mapper.insertFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		mapper.updateFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		mapper.deleteFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
		return mapper.getFaqList(vo);
	}

	@Override
	public FaqVO editFaqForm(FaqVO vo) {
		return mapper.editFaqForm(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {
		return mapper.getFaq(vo);
	}

	@Override
	public FaqVO faqForm(FaqVO vo) {
		return mapper.faqForm(vo);
	}

	@Override
	public Object getFaqList(FaqVO vo, MemberVO user) {
		return mapper.getFaqList(vo);
	}
}
<<<<<<< HEAD
=======
package com.project.plus.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.FaqVO;
import com.project.plus.domain.MemberVO;
import com.project.plus.mapper.FaqMapper;
import com.project.plus.service.FaqService;

@Service("FaqService")
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqMapper mapper;

	@Override
	public void insertFaq(FaqVO vo) {
		mapper.insertFaq(vo);
	}

	@Override
	public void updateFaq(FaqVO vo) {
		mapper.updateFaq(vo);
	}

	@Override
	public void deleteFaq(FaqVO vo) {
		mapper.deleteFaq(vo);
	}

	@Override
	public List<FaqVO> getFaqList(FaqVO vo) {
		return mapper.getFaqList(vo);
	}

	@Override
	public FaqVO editFaqForm(FaqVO vo) {
		return mapper.editFaqForm(vo);
	}

	@Override
	public FaqVO getFaq(FaqVO vo) {
		return mapper.getFaq(vo);
	}

	@Override
	public FaqVO faqForm(FaqVO vo) {
		return mapper.faqForm(vo);
	}

	@Override
	public Object getFaqList(FaqVO vo, MemberVO user) {
		return mapper.getFaqList(vo);
	}
}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
=======
>>>>>>> 7161a5136ca54c2e0afd159888505446f1d6024c
