package com.company.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler  extends TextWebSocketHandler{ 

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

	// Ŭ���̾�Ʈ�� ������ ���� ó��
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		// ä�ù濡 ������ ����� ������ ����Ʈ�� ����
		sessionList.add(session);

		// ��� ���ǿ� ä�� ����
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage(session.getId() + "���� ���� �߽��ϴ�."));
		}
	}

	// Ŭ���̾�Ʈ�� ������ �޼��� ���� ó��
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// ��� ���ǿ� ä�� ����
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage(session.getId() + " : " + message.getPayload()));
		}
	}

	// Ŭ���̾�Ʈ�� ������ ���� ó��
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// ä�ù濡�� ������ ����� ������ ����Ʈ���� ����
		sessionList.remove(session);

		// ��� ���ǿ� ä�� ����
		for (int i = 0; i < sessionList.size(); i++) {
			WebSocketSession s = sessionList.get(i);
			s.sendMessage(new TextMessage(session.getId() + "���� ���� �߽��ϴ�."));
		}

	}
}
