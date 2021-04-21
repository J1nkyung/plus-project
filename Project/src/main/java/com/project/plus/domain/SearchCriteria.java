package com.project.plus.domain;

import java.math.BigDecimal;
import java.util.Arrays;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteria extends Criteria{

	private String searchType = "";
	private String keyword = "";
	
	private BigDecimal memberLatitude;
	private BigDecimal  memberLongitude;
	

	
}