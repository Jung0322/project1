package com.company.domain;


import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberDTO {
	private String userid; // 회원 아이디
    private String password; // 비밀번호
    private String nickname; // 닉네임
    private String email; // 이메일
    private String phone; // 휴대전화
    private String mytown; // 내 동네
    private boolean enabled; // 사용 여부
    private Date regdate; // 가입일
    
    // 권한 정보
    List<MemberAuthorityDTO> authList;
    
    
}
