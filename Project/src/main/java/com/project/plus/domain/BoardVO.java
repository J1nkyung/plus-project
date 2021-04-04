package com.project.plus.domain;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int boardNum;
	private int clubNum;
	private int memberNum;
	private String boardContent;
	private String boardPic;
	private Date boardRegDate;
	/*추가한 vo, 커뮤니티에서 꺼낼 때 필요한 vo , 근데 이렇게 중복되게 꺼내는게 맞는지 쩝 ,,,*/
	private String memberPic;
	private String memberNickname;
	

	
}
