package com.startoup.biz.list;

import java.util.List;

public interface ListService {
	
	public boolean insertList(ListVO vo);
	public List<ListVO> selectAllMember(ListVO vo);
	public List<ListVO> selectAllProduct(ListVO vo);
	public ListVO selectCount(ListVO vo);
	public List<ListVO> selectAllList(ListVO vo);

}
