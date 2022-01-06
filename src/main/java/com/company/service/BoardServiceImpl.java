package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceCriteria;
import com.company.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper mapper;

	@Override
	public boolean register(BoardDTO insertDTO) {
		return mapper.insert(insertDTO) > 0 ? true : false;
	}

	@Override
	public List<BoardDTO> getMytown(MyPlaceCriteria cri) {
		return mapper.listMytown(cri);
	}	
	
	@Override
	public List<BoardDTO> getList(MyPlaceCriteria cri) {
		return mapper.listAll(cri);
	}

	@Override
	public BoardDTO getRow(int mno) {
		return mapper.read(mno);
	}

	@Override
	public boolean modify(BoardDTO updateDto) {
		return mapper.update(updateDto) > 0 ? true : false;
	}

	@Override
	public BoardDTO readMemberInfo(String userid) {
		return mapper.readMemberInfo(userid);
	}

	@Override
	public boolean delete(int mno) {
		return mapper.delete(mno) > 0 ? true : false;
	}

	@Override
	public int getTotalCount(MyPlaceCriteria cri) {
		return  mapper.totalCnt(cri);
	}

	@Override
	public int getTotalCountMytown(MyPlaceCriteria cri) {
		return mapper.totalCntMytown(cri);
	}

	


}
