package com.startoup.biz.crawling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("crawlingService")
public class CrawlingServiceImpl implements CrawlingService {
	
	@Autowired
	private CrawlingDAO cdao;

	@Override
	public boolean crawling() {
		return cdao.crawling();
	}

}
