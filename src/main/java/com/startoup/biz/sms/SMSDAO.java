package com.startoup.biz.sms;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SMSDAO {
	public int sns(SMSVO svo) {

		int randNum = (int)(Math.random()*(9000))+1000; // 4자리 인증번호

		String api_key = ""; // 테스트시 가입 후 입력
		String api_secret = ""; // 테스트시 가입 후 입력
		Message coolsms = new Message(api_key , api_secret);   

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to",svo.getsNum() ); // 수신번호
		params.put("from","01012345678"); // 발신번호
		params.put("type","sms"); // SMS의 문자
		params.put("text","Coolsms Testing Message! "+randNum); // 문자내용
		params.put("app_version", "test app 1.2"); 

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		}catch(CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return randNum;
	}
}