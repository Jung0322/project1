package com.company.service;

import java.util.List;

import com.company.domain.BoardDTO;

public interface BoardService {
	public boolean register(BoardDTO insertDTO);
	public List<BoardDTO> getList();
	public BoardDTO getRow(int mno);

}
