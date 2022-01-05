package com.company.mapper;

import java.util.List;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceCriteria;

public interface BoardMapper {
	public int insert(BoardDTO insertDTO);
	public List<BoardDTO> listAll(MyPlaceCriteria cri);
	public BoardDTO read(int mno);
	public int update(BoardDTO updateDto);
	public int delete(int mno);

	public int totalCnt(MyPlaceCriteria cri);
	public BoardDTO readMemberInfo(String userid);

}
