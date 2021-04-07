package com.project.plus.controller;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.project.plus.domain.MemberVO;

import lombok.extern.log4j.Log4j;

@Log4j
public class EchoHandler extends TextWebSocketHandler {

	private Map<Integer, WebSocketSession> users = new ConcurrentHashMap<Integer, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		int mNum = getMemberNum(session);
		if(mNum != 0) {
			users.put(mNum, session);
		} else {
			log.info("유저가 없습니다");
		}
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		int mNum = getMemberNum(session);
//		String senderId = getMemberId(session);
//		// 특정 유저에게 보내기
		String msg = message.getPayload();
		if(msg != null) {
			
		}
//			String[] strs = msg.split(",");
//			log(strs.toString());
//			if(strs != null && strs.length == 4) {
//				String type = strs[0];
//				String target = strs[1]; // m_id 저장
//				String content = strs[2];
//				String url = strs[3];
//				WebSocketSession targetSession = users.get(target);  // 메시지를 받을 세션 조회
//				
//				// 실시간 접속시
//				if(targetSession!=null) {
//					// ex: [&분의일] 신청이 들어왔습니다.
//					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + type + "</b>] " + content + "</a>" );
//					targetSession.sendMessage(tmpMsg);
//				}
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
	}
	
	private int getMemberNum(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		MemberVO user = (MemberVO) httpSession.get("user"); 
		int mNum = user.getMemberNum();
		if(mNum != 0) {
			return mNum;
		} else {
			return 0;
		}
	}

}
