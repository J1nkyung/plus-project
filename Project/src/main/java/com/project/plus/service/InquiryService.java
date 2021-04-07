<<<<<<< HEAD
package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;

public interface InquiryService {
	
	void inquiryForm(InquiryVO vo);
	void writeInquiry(InquiryVO vo);
	InquiryVO editInquiryForm(InquiryVO vo);
	void editInquiry(InquiryVO vo);
	void deleteInquiry(InquiryVO vo);

	InquiryVO getInquiry(InquiryVO vo);

	public List<InquiryVO> getInquiryList(CriteriaAdmin cri) throws Exception;
	public int inquiryListCount(CriteriaAdmin cri) throws Exception;
}
=======
package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.CriteriaAdmin;
import com.project.plus.domain.InquiryVO;

public interface InquiryService {
	
	void inquiryForm(InquiryVO vo);
	void writeInquiry(InquiryVO vo);
	InquiryVO editInquiryForm(InquiryVO vo);
	void editInquiry(InquiryVO vo);
	void deleteInquiry(InquiryVO vo);

	InquiryVO getInquiry(InquiryVO vo);

	public List<InquiryVO> getInquiryList(CriteriaAdmin cri) throws Exception;
	public int inquiryListCount(CriteriaAdmin cri) throws Exception;
}
>>>>>>> e7608280895d9fd2dfe2abf9ce350ac13feeabc3
