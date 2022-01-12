package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.company.domain.MyPlaceReplyDTO;
import com.company.mapper.BoardMapper;
import com.company.mapper.MyPlaceReplyMapper;

@Service
public class MyPlaceReplyServiceImpl implements MyPlaceReplyService {

	@Autowired
	private MyPlaceReplyMapper replyMapper;
	
	@Autowired
	private BoardMapper boardMapper;

	//mno가 같은 댓글 가져오기
	public List<MyPlaceReplyDTO> getList(int mno) {
		return replyMapper.list(mno);
	}

	@Transactional
	public boolean insertReply(MyPlaceReplyDTO insertDto) {
		//보드 테이블의 댓글 갯수 증가
		boardMapper.updateReplyCnt(insertDto.getMno(), 1);
		return replyMapper.insert(insertDto) > 0 ? true : false;
	}

	@Override
	public boolean updateReply(MyPlaceReplyDTO updateDto) {
		return replyMapper.update(updateDto) > 0 ? true : false;
	}

	@Transactional
	public boolean deleteReply(int mrno) {
		//보드 테이블의 댓글 갯수 감소
		MyPlaceReplyDTO reply = replyMapper.get(mrno);	
		boardMapper.updateReplyCnt(reply.getMno(), -1);
		return replyMapper.delete(mrno) > 0 ? true : false;
	}

	//댓글 작성자 정보 가져오기
	@Override
	public MyPlaceReplyDTO getInfoReply(String userid) {
		return replyMapper.getInfoReply(userid);
	}

	@Override
	public MyPlaceReplyDTO getRow(int mrno) {
		return replyMapper.get(mrno);
	}

}
