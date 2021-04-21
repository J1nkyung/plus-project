package com.project.plus.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchCriteriaMem extends CriteriaMem{
	
	private String searchType = "";
	private String keyword ="";
	


}
