package com.startoup.biz.myfunding;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MyFundingServiceImpl implements MyFundingService {
	
	@Autowired
	private FundingDAO myfundingDAO;

}
