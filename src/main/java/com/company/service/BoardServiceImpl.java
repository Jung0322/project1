package com.company.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceCriteria;
import com.company.mapper.BoardMapper;
import com.company.mapper.MyPlaceReplyMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;
	@Autowired
	private MyPlaceReplyMapper replyMapper;

	//게시글 작성하기
	public boolean register(BoardDTO insertDTO) {
		return mapper.insert(insertDTO)> 0 ? true : false;
	}	
	
	//모든 동네 게시글 보여주기
	public List<BoardDTO> getList(MyPlaceCriteria cri) {
		return mapper.listAll(cri);
	}

	//게시글 하나 읽기
	public BoardDTO getRow(int mno) {
		return mapper.read(mno);
	}

	//게시글 수정하기
	public boolean modify(BoardDTO updateDto) {
		return mapper.update(updateDto) > 0 ? true : false;
	}

	//멤버 정보 읽어오기
	public BoardDTO readMemberInfo(String userid) {
		return mapper.readMemberInfo(userid);
	}

	//게시글 삭제하기
	public boolean delete(int mno) {
		return mapper.delete(mno) > 0 ? true : false;
	}

	//게시글 전체 갯수
	public int getTotalCount(MyPlaceCriteria cri) {
		return  mapper.totalCnt(cri);
	}

	//로그인 후 동네 게시물만 보여주기
	public List<BoardDTO> listMyTown(String mytown) {
		return mapper.listMyTown(mytown);
	}

	@Override
	public int totalCntMytown(MyPlaceCriteria cri, String mytown) {
		return mapper.totalCntMytown(cri, mytown);
	}

	//본인이 작성한 게시물만 보여주기
	public List<BoardDTO> listMyPage(String userid) {
		return mapper.listMyPage(userid);
	}




	


}
