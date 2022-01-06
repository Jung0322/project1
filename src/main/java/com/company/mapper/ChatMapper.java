package com.company.mapper;

import java.util.List;

import com.company.domain.ChatMessage;
import com.company.domain.ChatRoom;

public interface ChatMapper {
	
	public int createChat(ChatRoom room); // 채팅방 생성 
	
	public ChatRoom selectChatRoom(String roomId);
	
	public int insertMessage(ChatMessage chatMessage);
	
	public ChatMessage searchChatRoom(ChatRoom searchRoom);
	
	public List<ChatRoom> chatRoomList(String userId);
	
	
	
}
