package com.startoup.biz.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("ListService")
public class ListServiceImpl implements ListService{
	
	@Autowired
	private ListDAO ldao;

	@Override
	public boolean insertList(ListVO vo) {
		return ldao.insertList(vo);
	}

	@Override
	public List<ListVO> selectAllMember(ListVO vo) {
		return ldao.selectAllMember(vo);
	}

	@Override
	public List<ListVO> selectAllProduct(ListVO vo) {
		return ldao.selectAllProduct(vo);
	}

	@Override
	public ListVO selectCount(ListVO vo) {
		return ldao.selectCount(vo);
	}

}
