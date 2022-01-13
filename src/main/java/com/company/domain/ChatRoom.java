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
public class ChatRoom {
	// 방 번호와 사용자 - 상대방의 정보가 담겨있다.
	// roomId 로 채팅방을 구분하며, 
	// unReadCount를 통해 읽었는지 파악 할 수 있게 해준다.
	
    private String roomid;        // 방 번호
    
    private String userid;    // 사용자 아이디
    private String usernickname;    // 사용자 닉네임
    
    private String masterid;    // 상대방 아이디
    private String masternickname; // 상대방 닉네임
    
    private int unReadCount;    // 안 읽은 메세지 수

    
}
