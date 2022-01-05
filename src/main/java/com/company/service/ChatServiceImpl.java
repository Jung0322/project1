package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ChatMessage;
import com.company.domain.ChatRoom;
import com.company.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatMapper mapper;
	
	@Override
	public ChatRoom selectChatRoom(String roomId) {
		return mapper.selectChatRoom(roomId);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return 0;
	}

	@Override
	public List<ChatMessage> messageList(String roomId) {
		return null;
	}

	@Override
	public int createChat(ChatRoom room) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ChatRoom> chatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateCount(ChatMessage message) {
		// TODO Auto-generated method stub
		return 0;
	}

}
