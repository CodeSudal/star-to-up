//package com.startoup.biz.crawling;
//
//import org.openqa.selenium.WebDriver;
//import org.openqa.selenium.chrome.ChromeDriver;
//import org.openqa.selenium.chrome.ChromeOptions;
//import org.openqa.selenium.firefox.FirefoxDriver;
//
//import edu.emory.mathcs.backport.java.util.concurrent.TimeUnit;
//
//public class Webdriver {
//
//    //WebDriver 설정
//    private WebDriver driver;
//
//    //Properties 설정
//    public static String WEB_DRIVER_ID = "webdriver.chrome.driver";
//    public static String WEB_DRIVER_PATH = "/Users/chromedriver"; // 다운받은 크롬드라이버 경로
//
//
//    public Webdriver() {
//        //System Property SetUp
//
//        chrome();
//        //firefox();
//    }
//    
//    private void chrome(){
//        System.setProperty("webdriver.chrome.driver", DRIVER_PATH);
//		ChromeOptions options = new ChromeOptions();
//		options.setHeadless(true);
//		options.addArguments("--lang=ko");
//	    options.addArguments("--no-sandbox");
//	    options.addArguments("--disable-dev-shm-usage");
//		options.addArguments("--disable-gpu");
//        options.setCapability("ignoreProtectedModeSettings", true);
//
//
//	    ChromeDriver driver = new ChromeDriver(options);
//	    driver.manage().timeouts().pageLoadTimeout(30, TimeUnit.SECONDS);
//    }
//    
//    private void firefox() {
//        System.setProperty("webdriver.gecko.driver", "/Users/eomjuntae/develop/spring/crawling/src/main/resources/geckodriver");
//        driver = new FirefoxDriver();
//    }
//    
//    public void useDriver(String url) {
//    	driver.get(url);	
//    }
//}    