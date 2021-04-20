package com.project.plus.domain;



import java.util.Date;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentsVO {
	private int commentsNum;
	private int memberNum;
	private int boardNum;
	
	@JsonFormat(pattern="yyyy. MM. dd HH:mm", timezone ="Asia/Seoul")
	private Date commentsRegdate;
	
	//private String commentsRegdate;
	private String commentsContent;
	private String memberNickname;
	private String memberPic;
	private int boardWriter;
	
	private int commentsClass;
	private int commentsOrder;
	private int commentsGroupNum;
	/*20210410 정연추가 내 comments 보기 할 때 필요 */
	private String boardContent;
	private Date boardRegdate;
	
}
