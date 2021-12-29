package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.ReplyDTO;
import com.company.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyMapper replyMapper;
	
	@Override
	public List<ReplyDTO> getList(int mno) {
		return replyMapper.list(mno);
	}

	@Override
	public boolean insertReply(ReplyDTO insertDto) {
		return replyMapper.insert(insertDto) > 0 ? true : false;
	}
	
	

}
