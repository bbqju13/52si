package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CommentVO;

public interface CommentService {

	int edit(CommentVO cvo);

	int remove(int cno);

	int post(CommentVO cmvo);

	List<CommentVO> getList(int pno);
	
//	int getAvg(int pno);
	
//	int sumList(int pno);

}
