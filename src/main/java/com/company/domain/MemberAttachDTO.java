package com.company.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MemberAttachDTO {
	private String pfuuid; // uuid(pk)
	private String userid; // 아이디
	private String profileUploadPath; // 프로필 업로드 경로
	private String profileImgName; // 프로필 이미지 이름
}
