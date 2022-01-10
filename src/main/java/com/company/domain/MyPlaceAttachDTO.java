package com.company.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MyPlaceAttachDTO {
	private String muuid;
	private String muploadPath;
	private String mimgName;
	private boolean mfileType;
	
	private int mno;
}
