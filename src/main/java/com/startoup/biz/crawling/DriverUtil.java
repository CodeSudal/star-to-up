package com.startoup.biz.crawling;

import java.util.HashMap;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;


public class DriverUtil {
	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "/Users/ljh0323/Desktop/Program/chromedriver_mac_arm64/chromedriver";
	public static Map<String, String> craw = new HashMap<>();

	public static void crawling() { 
		
		System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		ChromeOptions options = new ChromeOptions();
		options.addArguments("--remote-allow-origins=*");
		
		// options.addArguments("headless");
		// 브라우저 보이지 않기
		/*
		 * headless mode를 사용하면 자바스크립트를 많이 사용해서 html을 로드하는 사이트의 경우 
		 * 가끔 모든 html이 로드되지 않을 수 있음.
		 * 그런 사이트는 굳이 이유가없다면 headless 옵션을 끄고 크롤링하는게 좋음.
		 * 또한 chromedriver는 headless모드에 적합하지 않음.
		 * 잔오류가 많기 때문에 firefox 혹은 
		 * 다른 headless모드 지원하는 드라이버로 테스트하는 것이 좋음.
		 */

		WebDriver driver = new ChromeDriver(options);

		String url = "https://astro.kasi.re.kr/learning/pageView/5123";

		driver.get(url);

		//브라우저 이동시 생기는 로드시간을 기다린다.
		//HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
		try {Thread.sleep(1000);} catch (InterruptedException e) {}

		String name="";
		String info="";

		for(int i=2; i<11; i++) {
			driver.findElement(By.cssSelector("#leftNav1_drop > li:nth-child("+i+")")).click();
			name=driver.findElement(By.cssSelector("#leftNav1_drop > li:nth-child("+i+")")).getText();
			info=driver.findElement(By.className("content_wrap")).getText();
			System.out.println("------------");
			System.out.println("[ "+name+" ]");
			System.out.println(info);
			System.out.println("------------");
			craw.put(name, info);
			try {Thread.sleep(1000);} catch (InterruptedException e) {}
		}
		
		// craw.forEach((key, value) -> System.out.println(key + " : " + value));
		
		// 현재 보고 있는 탭만 닫기
		// driver.close();
		
		// 모든 탭 닫기
		driver.quit();
	}

	public static void crawClear() { 
		craw.clear();
	}
	
	public static void main(String[] args) {
		crawling();
	}
}