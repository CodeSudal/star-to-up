package com.startoup.biz.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("emailService")
public class EmailServiceImpl implements EmailService{
	
	@Autowired
	private EmailDAO emailDAO;

}
