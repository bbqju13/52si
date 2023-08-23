package com.myweb.www.repository;

import java.util.List;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ProductVO;

public interface ProductDAO {

	int insert(ProductVO pvo);

	List<ProductVO> getList(String type_a);

	int selectPno();

	List<ProductVO> isThere();

	ProductVO getDetail(int pno);

	int getTotalCount(PagingVO pgvo);

	List<ProductVO> getAdminList(PagingVO pgvo);

	int updateProduct(ProductVO pvo);

	List<ProductVO> getSearchList(String searchKeyword);

	int delete(int pno);

}
