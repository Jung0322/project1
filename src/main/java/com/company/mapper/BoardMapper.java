package com.company.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.company.domain.BoardDTO;
import com.company.domain.MyPlaceCriteria;

public interface BoardMapper {
	public List<BoardDTO> listAll(MyPlaceCriteria cri);
	public List<BoardDTO> listMyTown(String mytown);
	public List<BoardDTO> listMyPage(String userid);
	
	public int insert(BoardDTO insertDTO);
	public BoardDTO read(int mno);
	public int update(BoardDTO updateDto);
	public int delete(int mno);

	public int totalCnt(MyPlaceCriteria cri);
	public int totalCntMytown(@Param("cri") MyPlaceCriteria cri, @Param("mytown") String mytown);
	
	public int updateReplyCnt(@Param("mno") int mno, @Param("amount") int amount);
	public int updateCuriousCnt(@Param("mno") int mno, @Param("amount") int amount);
	
	public BoardDTO readMemberInfo(String userid);

}
