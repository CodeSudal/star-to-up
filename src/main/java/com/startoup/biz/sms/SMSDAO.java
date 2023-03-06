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
	public int SMS(SMSVO svo) {

		int randNum = (int)(Math.random()*(9000))+1000; // 4자리 인증번호

		String api_key = "NCSYJJBPPFN2BFTA"; // 테스트시 가입 후 입력
		String api_secret = "4JTYBBKMSVRNBV6ZYESOPVAQ8ZELSJ4F"; // 테스트시 가입 후 입력
		Message coolsms = new Message(api_key , api_secret);   

		HashMap<String, String> params = new HashMap<String, String>();
		
		// 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", userPhoneNumber);    // 수신전화번호
        params.put("from", "01094618018");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력
        params.put("app_version", "test app 1.2"); // application name and version
//		params.put("to",svo.getsNum() ); // 수신번호
//		params.put("from","01012345678"); // 발신번호
//		params.put("type","sms"); // SMS의 문자
//		params.put("text","Coolsms Testing Message! "+randNum); // 문자내용
//		params.put("app_version", "test app 1.2"); // 쿨SMS버전인듯

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		//return randNum;
	}
}