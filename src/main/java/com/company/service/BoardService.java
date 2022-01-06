package com.company.service;

import java.util.List;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceCriteria;

public interface BoardService {
	public List<BoardDTO> getList(MyPlaceCriteria cri);
	public List<BoardDTO> getMytown(MyPlaceCriteria cri);
	
	public boolean register(BoardDTO insertDTO);
	public BoardDTO getRow(int mno);
	public boolean modify(BoardDTO updateDto);
	public boolean delete(int mno);
	
	public int getTotalCount(MyPlaceCriteria cri);
	public int getTotalCountMytown(MyPlaceCriteria cri);
	
	public BoardDTO readMemberInfo(String userid);

}
