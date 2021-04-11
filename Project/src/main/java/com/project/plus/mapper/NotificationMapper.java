package com.project.plus.mapper;

import java.util.List;

import com.project.plus.domain.NotificationVO;

public interface NotificationMapper {
	public int insertCommNoti(NotificationVO noti);
	public List<NotificationVO> getUnreadNoti(int memberNum);
	public List<NotificationVO> getReadNoti(int memberNum);
	public int deleteNoti(NotificationVO noti);
	public int updateStatus(NotificationVO noti);
	public int getTimeDiff(int notId);
}
