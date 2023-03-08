package com.startoup.biz.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDAO pdao;

	@Override
	public boolean checkProduct(ProductVO vo) {
		return pdao.checkProduct(vo);
	}

	@Override
	public boolean insertProduct(ProductVO vo) {
		return pdao.insertProduct(vo);
	}

	@Override
	public boolean updateProduct(ProductVO vo) {
		return pdao.updateProduct(vo);
	}

	@Override
	public boolean deleteProduct(ProductVO vo) {
		return pdao.deleteProduct(vo);
	}

	@Override
	public List<ProductVO> selectAll(ProductVO vo) {
		return pdao.selectAll(vo);
	}

	@Override
	public ProductVO selectOne(ProductVO vo) {
		return pdao.selectOne(vo);
	}
	
	

}
