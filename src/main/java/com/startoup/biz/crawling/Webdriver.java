package com.startoup.biz.crawling;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;


public class Webdriver {

	public static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	public static final String WEB_DRIVER_PATH = "/Users/ljh0323/Desktop/Program/chromedriver_mac_arm64/chromedriver";

	 public static void main(String[] args) {
		    System.setProperty(WEB_DRIVER_ID, WEB_DRIVER_PATH);

		    ChromeOptions options = new ChromeOptions();
		    options.addArguments("--remote-allow-origins=*");
		    // options.addArguments("headless");
		    // 브라우저 보이지 않기

		    WebDriver driver = new ChromeDriver(options);
		   // driver.get("https://www.google.com/");

//		    driver.findElement(By.name("q")).sendKeys("아이유");
//		    driver.findElement(By.name("q")).sendKeys(Keys.ENTER);
		    
		    String url = "https://astro.kasi.re.kr/learning/pageView/5123";
		    
		    driver.get(url);
		    
		    //브라우저 이동시 생기는 로드시간을 기다린다.
			//HTTP응답속도보다 자바의 컴파일 속도가 더 빠르기 때문에 임의적으로 1초를 대기한다.
			try {Thread.sleep(5000);} catch (InterruptedException e) {}
			
			String XPath = "//*[@id=\"cont_skip\"]/div[2]/div[2]/text()";
			
			String info=driver.findElement(By.xpath(XPath)).getText();
		    
		    System.out.println(info);
		    // 브라우저 닫기
		    if (driver != null) {
		      // driver.close();
		      // driver.quit();
		    }
		  }
		}