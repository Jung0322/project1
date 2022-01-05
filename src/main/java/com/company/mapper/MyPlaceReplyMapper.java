package com.company.mapper;

import java.util.List;

import com.company.domain.MyPlaceReplyDTO;

public interface MyPlaceReplyMapper {
	public List<MyPlaceReplyDTO> list(int mno);
	public int insert(MyPlaceReplyDTO insertDto);
	public int update(MyPlaceReplyDTO updateDto);
	public int delete(int mno);
	public int getCountByMno(int mno);
	
	public MyPlaceReplyDTO getInfoReply(String userid);
}
