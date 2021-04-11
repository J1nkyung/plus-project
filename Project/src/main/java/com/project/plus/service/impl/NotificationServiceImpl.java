package com.project.plus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.plus.domain.NotificationVO;
import com.project.plus.mapper.NotificationMapper;
import com.project.plus.service.NotificationService;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired
	NotificationMapper mapper;
	
	@Override
	public int insertCommNoti(NotificationVO noti) {
		return mapper.insertCommNoti(noti);
	}

	@Override
	public List<NotificationVO> getUnreadNoti(int memberNum) {
		return mapper.getUnreadNoti(memberNum);
	}

	@Override
	public List<NotificationVO> getReadNoti(int memberNum) {
		return mapper.getReadNoti(memberNum);
	}

	@Override
	public int deleteNoti(NotificationVO noti) {
		return mapper.deleteNoti(noti);
	}

	@Override
	public int updateStatus(NotificationVO noti) {
		return mapper.updateStatus(noti);
	}

	@Override
	public int getTimeDiff(int notId) {
		return mapper.getTimeDiff(notId);
	}

}
