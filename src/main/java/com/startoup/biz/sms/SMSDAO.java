package com.startoup.biz.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("smsDAO")
public class SMSDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public void certifiedPhoneNumber(SMSVO svo) {

		String api_key = "NCSYJJBPPFN2BFTA";
		String api_secret = "4JTYBBKMSVRNBV6ZYESOPVAQ8ZELSJ4F";
		Message coolsms = new Message(api_key , api_secret);   
		
		// 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", svo.getsNum());    // 수신전화번호
        params.put("from", "01094618018");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[TEST] 인증번호는" + "["+svo.getsAuth()+"]" + "입니다."); // 문자 내용 입력
        params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}