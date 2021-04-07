package com.project.plus.service;

import java.util.List;

import com.project.plus.domain.ChatVO;
import com.project.plus.domain.ClubVO;

public interface ChatService {
	public List<ClubVO> getChatList(int memNum);
	public List<ChatVO> getMessages(int clubNum);
	public int insertMessage(ChatVO msg);
	public Integer checkRoomId(int clubNum);
}
