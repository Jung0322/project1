package com.company.mapper;

import java.util.List;

import com.company.domain.BoardDTO;

public interface BoardMapper {
	public int insert(BoardDTO insertDTO);
	public List<BoardDTO> listAll();
	public BoardDTO read(int mno);
	public int update(BoardDTO updateDto);

	public BoardDTO readMemberInfo(String userid);

}
