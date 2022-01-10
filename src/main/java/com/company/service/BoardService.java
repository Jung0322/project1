package com.company.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceCriteria;

public interface BoardService {
	public List<BoardDTO> getList(MyPlaceCriteria cri);
	public List<BoardDTO> listMyTown(String mytown);
	public List<BoardDTO> listMyPage(String userid);
	
	public boolean register(BoardDTO insertDTO);
	public BoardDTO getRow(int mno);
	public boolean modify(BoardDTO updateDto);
	public boolean delete(int mno);
	
	public int getTotalCount(MyPlaceCriteria cri);
	public int totalCntMytown(MyPlaceCriteria cri, String mytown);
	
	
	public BoardDTO readMemberInfo(String userid);
	
	

}
