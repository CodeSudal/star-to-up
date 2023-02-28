package com.startoup.biz.myfunding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class FundingServiceImpl implements FundingService {
	
	@Autowired
	private FundingDAO myfundingDAO;

}
