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
	public ChatRoom selectChatRoom(String roomid) {
		return mapper.selectChatRoom(roomid);
	}

	@Override
	public int insertMessage(ChatMessage chatMessage) {
		return mapper.insertMessage(chatMessage);
	}

	@Override
	public List<ChatMessage> messageList(String roomid) {
		return mapper.messageList(roomid);
	}

	@Override
	public int createChat(ChatRoom room) {
		return mapper.createChat(room);
	}

	@Override
	public ChatRoom searchChatRoom(ChatRoom room) {
		return mapper.searchChatRoom(room);
	}

	@Override
	public List<ChatRoom> chatRoomList(String userid) {
		return mapper.chatRoomList(userid);
	}

	@Override
	public int selectUnReadCount(ChatMessage message) {
		return mapper.selectUnReadCount(message);
	}

	@Override
	public int updateCount(ChatMessage message) {
		return mapper.updateCount(message);
	}

}
