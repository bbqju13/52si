package com.myweb.www.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.repository.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService{
	
	@Inject
	private CommentDAO cmdao;

	@Override
	public int edit(CommentVO cmvo) {
		return cmdao.edit(cmvo);
	}

	@Override
	public int remove(int cno) {
		return cmdao.remove(cno);
	}

	@Override
	public int post(CommentVO cmvo) {
		return cmdao.insert(cmvo);
	}

	@Override
	public List<CommentVO> getList(int pno) {
		return cmdao.getList(pno);
	}

//	@Override
//	public int sumList(int pno) {
//		return cmdao.sumList(pno);
//	}

//	@Override
//	public int getAvg(int pno) {
//		return cmdao.getAvg(pno);
//	}
}


