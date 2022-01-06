package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.MyPlaceReplyDTO;
import com.company.mapper.MyPlaceReplyMapper;

@Service
public class MyPlaceReplyServiceImpl implements MyPlaceReplyService {

	@Autowired
	private MyPlaceReplyMapper replyMapper;

	@Override
	public List<MyPlaceReplyDTO> getList(int mno) {
		return replyMapper.list(mno);
	}

	@Override
	public boolean insertReply(MyPlaceReplyDTO insertDto) {
		return replyMapper.insert(insertDto) > 0 ? true : false;
	}

	@Override
	public boolean updateReply(MyPlaceReplyDTO updateDto) {
		return replyMapper.update(updateDto) > 0 ? true : false;
	}

	@Override
	public boolean deleteReply(int mrno) {
		return replyMapper.delete(mrno) > 0 ? true : false;
	}

	@Override
	public MyPlaceReplyDTO getInfoReply(String userid) {
		return replyMapper.getInfoReply(userid);
	}

	@Override
	public MyPlaceReplyDTO getRow(int mrno) {
		return replyMapper.get(mrno);
	}

}
