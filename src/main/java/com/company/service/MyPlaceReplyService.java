package com.company.service;

import java.util.List;

import com.company.domain.MyPlaceReplyDTO;

public interface MyPlaceReplyService {
	public List<MyPlaceReplyDTO> getList(int mno);
	public boolean insertReply(MyPlaceReplyDTO insertDto);
	public boolean updateReply(MyPlaceReplyDTO updateDto);
	public boolean deleteReply(int mrno);
	
	public MyPlaceReplyDTO getInfoReply(String userid);
}
