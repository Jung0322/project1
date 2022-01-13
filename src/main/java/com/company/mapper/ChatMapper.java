package com.company.mapper;

import java.util.List;

import com.company.domain.ChatMessage;
import com.company.domain.ChatRoom;

public interface ChatMapper {
	
	public int createChat(ChatRoom room); // 채팅방 생성 
	
	public ChatRoom selectChatRoom(String roomid); // 채팅방 가져오기 
	
	public int insertMessage(ChatMessage chatMessage); // 상호간 메세지 데이터 값 넣기
	
	public ChatMessage searchChatRoom(ChatRoom searchRoom); // 채팅방의 메세지 정보 가져오기
	
	public List<ChatRoom> chatRoomList(String userId);  // 로그인한 유저의 채팅방 가져오기
	
	public int selectUnReadCount(ChatMessage message); // 메세지 서로 간 읽었는지 확인가능

	public int updateCount(ChatMessage message); // 읽지 않은 메세지 수
	
	public List<ChatMessage> messageList(String roomid); //메세지 내용 리스트 출력
	
	
	
	
	
}
