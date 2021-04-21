package com.project.plus.controller;

import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.plus.domain.ChatVO;
import com.project.plus.service.ChatService;

import lombok.extern.log4j.Log4j;

@Log4j
public class ChatHandler extends TextWebSocketHandler {

	@Autowired
	ChatService chatService;
	
		private final ObjectMapper objectMapper = new ObjectMapper();
	    // 채팅방 목록 <방 번호, 방에 해당하는 session의 리스트>
	    private Map<Integer, ArrayList<WebSocketSession>> RoomList = new ConcurrentHashMap<Integer, ArrayList<WebSocketSession>>();
	    // session, 방 번호가 들어간다.
	    private Map<WebSocketSession, Integer> sessionList = new ConcurrentHashMap<WebSocketSession, Integer>();
	    // 채팅방의 접속중인 인원 수 
	    private Map<Integer, Integer> userCount = new ConcurrentHashMap<Integer, Integer>();
	    // 채팅방에 접속중인 유저 리스트 
	    private Map<String, Integer> userList = new ConcurrentHashMap<String, Integer>();
	  
      

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("채팅 접속 >> " + session.getId());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String textMsg = message.getPayload();
		log.info("넘어온 메시지는 : " + textMsg);
		ChatVO chat = objectMapper.readValue(textMsg, ChatVO.class);
		
		int roomId = chat.getClubNum();
		log.info("클럼 num : " + roomId);
		
		// 채팅방 생성 
		 if(RoomList.get(roomId) == null && chat.getChatMessage().equals("ENTER") && roomId != 0) {
			 // 채팅방에 들어갈 session들
			 ArrayList<WebSocketSession> roomSessions = new ArrayList<>();
	           
	            // 현재 세션을 roomSessions에 추가
	            roomSessions.add(session);
	            // sessionList에 현재 세션을 clubNum(roomId)와 함께 추가
	            sessionList.put(session, roomId);
	            // RoomList에 추가
	            RoomList.put(roomId, roomSessions);
	            
	            // 각 채팅방에 해당하는 참여인원 수 세기 
	            int people=0;
	            userCount.put(roomId, ++people);
	          //  userList.put(chat.getMemberNickname(),roomId);
	            
	            log.info("생성#####" + roomId + " and "  + userCount.get(roomId) + "명");
	            
	      // 채팅방 입장 
		 }else if(RoomList.get(roomId) != null && chat.getChatMessage().equals("ENTER") && roomId != 0) {
			 // 해당하는 방번호에 세션을 추가한다 
	            RoomList.get(roomId).add(session);
	            // sessionList에 추가
	            sessionList.put(session, roomId);
	            
	            int people = userCount.get(roomId);
	            userCount.put(roomId, ++people);
	            userList.put(chat.getMemberNickname(),roomId);
	            String jsonString = objectMapper.writeValueAsString(userList);
	            
	    		TextMessage textMessage = new TextMessage("ENTER," + chat.getMemberNickname() + "," + userCount.get(roomId) + ",json" + jsonString);
	    		log.info("입장#####" + roomId + " and " + people + "명");
	            
	            for(WebSocketSession curSessions : RoomList.get(roomId)) {
                	curSessions.sendMessage(textMessage);
                }
	            
	         // 채팅방 퇴장 
		    } else if(RoomList.get(roomId) != null && chat.getChatMessage().equals("LEAVE") && roomId != 0) {
		      	            
		      		          //퇴장시 세션 지우기 
		      	RoomList.get(sessionList.get(session)).remove(session);
		      	sessionList.remove(session);
		      		         
		      	int people = userCount.get(roomId);
		      	userCount.put(roomId, --people);
		      	userList.remove(chat.getMemberNickname());
		      	String jsonString = objectMapper.writeValueAsString(userList);
		      	TextMessage textMessage = new TextMessage("LEAVE," + chat.getMemberNickname() + "," + userCount.get(roomId) +  ",json" + jsonString);
		      	log.info("퇴장#####" + roomId + " and " + people + "명");
		      		         
		       for(WebSocketSession curSessions : RoomList.get(roomId)) {
		      		  curSessions.sendMessage(textMessage);
		      }
		      		              
	            
	       // 입장 메시지가 아닌 채팅 메시지만 받았을 시에는 세션을 또 생성하면 안된다. 
		 } else if (RoomList.get(roomId) != null && !chat.getChatMessage().equals("ENTER") && roomId != 0) {
	                // 메세지에 이름, 이메일, 내용을 담는다.
	                TextMessage textMessage = new TextMessage(chat.getMemberNickname() + "," + chat.getChatMessage());
	                log.info("메시지 전송#####" + roomId + textMessage);
	                
	                // 현재 session 수
	                int sessionCount = 0;
	     
	                // 해당 채팅방의 session에 뿌려준다.
	                for(WebSocketSession curSessions : RoomList.get(roomId)) {
	                	curSessions.sendMessage(textMessage);
	                    log.info(">>>>> 해당 채팅방에 메시지 전송");
	                    sessionCount++;
	                    log.info("세션 개수 : " + sessionCount);
	                    
	                }
		 }      
	
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		   if(sessionList.get(session) != null) {
			   // 서버와의 연결이 끊겼을 시에도 채팅인원 감소 
			   int people = userCount.get(sessionList.get(session));
			   userCount.put(sessionList.get(session), --people);
			   // sessionList에서 해당하는 세션을 통해 방 번호를 찾고, 그 방에 들어있는 세션을 지운다 
	            RoomList.get(sessionList.get(session)).remove(session);
	            sessionList.remove(session);
	        }
	}

}
