package com.company.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.domain.BoardDTO;
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
	public List<BoardDTO> getList() {
		return mapper.listAll();
	}

	@Override
	public BoardDTO getRow(int mno) {
		return mapper.read(mno);
	}	
	


}
