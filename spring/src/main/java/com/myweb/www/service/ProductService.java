package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductVO;

public interface ProductService {

	int register(ProductVO pvo);

	int register(ProductDTO pdto);

	List<ProductDTO> getDTOList(String type_a);

	List<ProductVO> isThere();

	ProductDTO getDetail(int pno);

	int removeFile(String uuid);

	int getTotalCount(PagingVO pgvo);

	List<ProductVO> getAdminList(PagingVO pgvo);

	int modifyDTO(ProductDTO pdto);

	List<ProductDTO> searchDTOList(String searchKeyword);

	int delete(int pno);

}
