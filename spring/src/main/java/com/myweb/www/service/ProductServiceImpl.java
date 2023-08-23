package com.myweb.www.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myweb.www.domain.FileVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.domain.ProductDTO;
import com.myweb.www.domain.ProductVO;
import com.myweb.www.repository.FileDAO;
import com.myweb.www.repository.ProductDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService {
	
	@Inject
	public ProductDAO pdao;
	
	@Inject
	private FileDAO fdao;

	@Override
	public int register(ProductVO pvo) {
		log.info(">>> product register in");
		return pdao.insert(pvo);
	}

	@Override
	public int register(ProductDTO pdto) {
		log.info("pvo + fList register in");
		int isOk = pdao.insert(pdto.getPvo());
		if(pdto.getFlist() == null) {
			isOk*=1;
		} else {
			if(isOk > 0 && pdto.getFlist().size()>0) {
				int pno = pdao.selectPno();
				for(FileVO fvo : pdto.getFlist()) {
					fvo.setPno(pno);
					log.info(">>> insert file > " + fvo.toString());
					isOk *= fdao.insertFile(fvo);
				}
			}
		}
		return isOk;
	}

	@Override
	public List<ProductDTO> getDTOList(String type_a) {
		log.info(">>> product list in");
		List<ProductVO> productList = pdao.getList(type_a);
		List<ProductDTO> dtoList = new ArrayList<>();
		for(ProductVO product : productList) {
			List<FileVO> fileList = fdao.getFileList(product.getPno());
			ProductDTO dto = new ProductDTO(product, fileList);
			dtoList.add(dto);
		}
		return dtoList;
	}

	@Override
	public List<ProductVO> isThere() {
		log.info(">>> product isThere in");
		return pdao.isThere();
	}

	@Override
	public ProductDTO getDetail(int pno) {
		log.info(">>> product getDetail in");
		ProductVO product = pdao.getDetail(pno);
		List<FileVO> fileList = fdao.getFileList(product.getPno());
		ProductDTO pdto = new ProductDTO(product, fileList);
		return pdto;
	}

	@Override
	public int removeFile(String uuid) {
		log.info(">>> product removeFile in");
		return fdao.removeFile(uuid);
	}

	@Override
	public int getTotalCount(PagingVO pgvo) {
		log.info(">>> product getTotalCount in");
		return pdao.getTotalCount(pgvo);
	}

	@Override
	public List<ProductVO> getAdminList(PagingVO pgvo) {
		log.info(">>> product getAdminList in");
		return pdao.getAdminList(pgvo);
	}

	@Override
	public int modifyDTO(ProductDTO pdto) {
	    log.info(">>> product modify in");
	    log.info(">>> pdto.pvo " + pdto.getPvo().toString());
	    log.info(">>> pdto.flist " + pdto.getFlist().toString());
	    int isOk=1;
	    	isOk = pdao.updateProduct(pdto.getPvo());
	    	log.info(">>> isOk > " + isOk);
	    	if(pdto.getFlist() == null) {
	 		   isOk *= 1;
	 	   } else {
	 		   if(isOk > 0 && pdto.getFlist().size() > 0) {
	 			   int pno = pdto.getPvo().getPno();
	 			   log.info(">>> pno > " + pno);
	 			   for(FileVO fvo : pdto.getFlist()) {
	 				   fvo.setPno(pno);
	 				   log.info(">>> insert file > " + fvo.toString());
	 				   isOk *= fdao.insertFile(fvo); //여기서 맵퍼로 저장을 못한다
	 				   //수정시 pvo수정됨, image도 폴더내 저장됨, 
	 			    }
	 		   }
	 	   }
	  
	    return isOk;
	}

	@Override
	public List<ProductDTO> searchDTOList(String searchKeyword) {
		log.info(">>> product Seach List in");
		log.info(">>> Search Keyword > " + searchKeyword);
		List<ProductVO> productList = pdao.getSearchList(searchKeyword);
		List<ProductDTO> dtoList = new ArrayList<>();
		for(ProductVO product : productList) {
			List<FileVO> fileList = fdao.getFileList(product.getPno());
			ProductDTO dto = new ProductDTO(product, fileList);
			dtoList.add(dto);
		}
		return dtoList;
	}

	@Override
	public int delete(int pno) {
		log.info("product delete in");
		return pdao.delete(pno);
	}

}
