package com.project.plus.domain;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class NotificationVO {
	private int notId;
	private int memberNum;
	private int inquiryNum;
	private int boardNum;
	private int clubNum;
	private String notType;
	private String notMessage;
	private String notUrl;
	private String notSendtime;
	private String timeDiff;
	private int notCheck;
}
