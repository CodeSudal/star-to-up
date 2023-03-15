package com.startoup.biz.crawling;

import java.util.HashMap;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;


public class DriverUtil {
	// 크롬 웹 드라이버
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	// 웹 드라이버 경로 지정
	public static final String WEB_DRIVER_PATH = "/Users/ljh0323/Desktop/Program/chromedriver_mac_arm64/chromedriver";
	// 크롤링한 정보를 담아줄 Map 객체 선언
	public static Map<String, String> craw = new HashMap<>();

	// 셀레니움 크롤링 함수
	public static void crawling() { 
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		// ChromeDriver 111.0.5563.19 버전의 오류를 해결하기 위한 option 추가
		options.addArguments("--remote-allow-origins=*");
		
		// options.addArguments("headless");
		// 브라우저 보이지 않기
		/*
		 * headless mode를 사용하면 자바스크립트를 많이 사용해서 html을 로드하는 사이트의 경우 
		 * 가끔 모든 html이 로드되지 않을 수 있음.
		 * 그런 사이트는 굳이 이유가 없다면 headless 옵션을 끄고 크롤링하는게 좋음.
		 * 또한 chromedriver는 headless모드에 적합하지 않음.
		 * 잔오류가 많기 때문에 firefox 혹은 
		 * 다른 headless모드 지원하는 드라이버로 테스트하는 것이 좋음.
		 */

		WebDriver driver = new ChromeDriver(options);
		
		// 크롤링할 사이트(target)
		String url = "https://astro.kasi.re.kr/learning/pageView/5123";

		driver.get(url);

		//브라우저 이동시 생기는 로드시간을 기다린다.
		//HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
		try {Thread.sleep(1000);} catch (InterruptedException e) {}
		
		// 크롤링할 대상 이름
		String name="";
		// 크롤링할 대상 정보
		String info="";

		// 원하는 정보만큼 for문
		for(int i=2; i<11; i++) {
			// i를 넣어 for문을 반복하며 원하는 부분(다음 부분)의 element를 지정
			
			// 해당 요소를 클릭하여 원하는 페이지로 이동
			driver.findElement(By.cssSelector("#leftNav1_drop > li:nth-child("+i+")")).click();
			// 해당 페이지의 크롤링 대상 이름 저장
			name=driver.findElement(By.cssSelector("#leftNav1_drop > li:nth-child("+i+")")).getText();
			// 해당 페이지의 크롤링 대상 정보 저장
			info=driver.findElement(By.className("content_wrap")).getText();
			System.out.println("------------");
			System.out.println("[ "+name+" ]");
			System.out.println(info);
			System.out.println("------------");
			// Map에 저장
			craw.put(name, info);
			// 로딩을 위한 쓰레드 슬립
			try {Thread.sleep(1000);} catch (InterruptedException e) {}
		}
		
		// craw.forEach((key, value) -> System.out.println(key + " : " + value));
		
		// 현재 보고 있는 탭만 닫기
		// driver.close();
		
		// 모든 탭 닫기
		driver.quit();
	}

	// Map에 담긴 데이터를 지우고 싶을 때 쓰는 함수
	public static void crawClear() { 
		craw.clear();
	}
}