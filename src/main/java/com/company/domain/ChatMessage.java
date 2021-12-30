package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatMessage {
//	본격적인 메세지 VO
//	방번호와 메세지번호 PK
//	sessionCount는 현재 1:1 채팅방에 들어와있는 유저 수이다.
//	sessionCount가 2이면 unReadCount는 0으로 DB에 집어넣을 수 있겠다.
//	[ => 2명이 들어와있으니 읽지않은 메세지는 없다.]
//	sessionCount가 1잉면 unReadCount는 1이 되는 것이다.
	
	private String roomId;            // 방 번호
    private String messageId;        // 메세지 번호
    private String message;            // 메세지 내용
    private String nickname;            // 보낸이 이름
    private String userid;            // 보낸이 아이디
    private int unReadCount;        // 안 읽은 메세지 수
    private int sessionCount;        // 현재 세션 수
    // sessionCount가 2 이면 unReadCount는 0으로 db에 집어넣을 수 있겠다.
    // => 2 명이 들어와있으니 읽지 않은 메세지는 없다.]
    //sessionCount가 1이면 unReadCount는 1이 되는것이다.
	
	
}
