package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentsVO {
	// 커멘츠 vo
	private int commentsNum;
	private int memberNum;
	private int boardNum;
	private Date commentsRegdate;
	private String commentsContent;
	
	
	private int commentsClass;
	private int commentsOrder;
	private int commentsGroupNum;
	
	
}
