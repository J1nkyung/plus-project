package com.project.plus.service;

import java.util.List;


import com.project.plus.domain.NotificationVO;

public interface NotificationService {
	public int insertCommNoti(NotificationVO noti);
	public List<NotificationVO> getUnreadNoti(int memberNum);
	public List<NotificationVO> getReadNoti(int memberNum);
	public int deleteNoti(NotificationVO noti);
	public int updateStatus(NotificationVO noti);
	public int getTimeDiff(int notId);
}
