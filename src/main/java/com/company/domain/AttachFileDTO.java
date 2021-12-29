package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttachFileDTO {
	private String muuid;
	private String muploadPath;
	private String mimgName;
	
	private int mno;
}
