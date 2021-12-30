package com.company.service;

import java.util.List;

import com.company.domain.ReplyDTO;

public interface ReplyService {
	public List<ReplyDTO> getList(int mno);
	public boolean insertReply(ReplyDTO insertDto);

}
