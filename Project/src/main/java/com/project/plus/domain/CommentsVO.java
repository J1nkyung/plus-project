package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentsVO {
	private int commentsNum;
	private int memberNum;
	private int boardNum;
	private String commentsRegdate;
	private String commentsChangedRegdate;
	private String commentsContent;
	private String memberNickname;
	private String memberPic;
	
	private int commentsClass;
	private int commentsOrder;
	private int commentsGroupNum;
}
