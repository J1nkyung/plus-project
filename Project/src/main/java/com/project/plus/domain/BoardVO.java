package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int boardNum;
	private int clubNum;
	private int memberNum;
	private String boardTitle;
	private String boardContent;
	private String boardPic;
	private Date boardRegDate;
	
	private String memberPic;
	private String memberNickname;
	private int commentsCount;
	

	public void setCommentsCount(int result) {
		this.commentsCount = result;
	}
	

}
