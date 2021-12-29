package com.company.mapper;

import java.util.List;

import com.company.domain.ReplyDTO;

public interface ReplyMapper {
	public List<ReplyDTO> list(int mno);
	public int insert(ReplyDTO insertDto);

}
