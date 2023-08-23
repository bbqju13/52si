package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.CommentVO;

public interface CommentDAO {

	int edit(CommentVO cmvo);

	int remove(int cno);

	int insert(CommentVO cmvo);

	List<CommentVO> getList(int pno);
	
//	int getAvg(int pno);
	
//	int sumList(int pno);
}
