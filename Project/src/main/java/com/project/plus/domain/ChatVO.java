package com.project.plus.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatVO {
	private String chatRoomId;
	private int messageNum;
	private int memberNum;
	private String memberNickname;
	private int clubNum;
	private String clubName;
	private String clubLeader;
	private Date chatSendTime;
	private String chatStringSendtime;
	private String chatMessage;
	private MemberVO members;
}
