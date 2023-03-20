package com.startoup.biz.product;

import java.util.List;

public interface ProductService {
	public boolean checkProduct(ProductVO vo);
	public boolean insertProduct(ProductVO vo);
	public boolean updateProduct(ProductVO vo);
	public boolean deleteProduct(ProductVO vo);
	public List<ProductVO> selectAll(ProductVO vo);
	public ProductVO selectOne(ProductVO vo);
	public ProductVO selectLastProduct(ProductVO vo);

}
