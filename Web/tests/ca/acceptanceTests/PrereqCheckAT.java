package ca.acceptanceTests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;
import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.support.ui.Select;

public class PrereqCheckAT {
  private WebDriver driver;
  private String baseUrl;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
    driver = new FirefoxDriver();
    baseUrl = "http://localhost:8080";
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testPrereqCheckAT() throws Exception {
    driver.get(baseUrl + "/Borealis-Web/login");
    driver.findElement(By.id("username")).clear();
    driver.findElement(By.id("username")).sendKeys("bob");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("4350");
    driver.findElement(By.id("submit_btn")).click();
    driver.findElement(By.linkText("Register Courses")).click();
    new Select(driver.findElement(By.id("term"))).selectByVisibleText("Winter 2015");
    driver.findElement(By.cssSelector("option[value=\"winter2015\"]")).click();
    for (int second = 0;; second++) {
    	if (second >= 60) fail("timeout");
    	try { if (isElementPresent(By.cssSelector("option[value=\"Biology\"]"))) break; } catch (Exception e) {}
    	Thread.sleep(1000);
    }

    new Select(driver.findElement(By.id("category"))).selectByVisibleText("Computer Science");
    driver.findElement(By.cssSelector("option[value=\"Computer Science\"]")).click();
    for (int second = 0;; second++) {
    	if (second >= 60) fail("timeout");
    	try { if (isElementPresent(By.id("register_10340"))) break; } catch (Exception e) {}
    	Thread.sleep(1000);
    }

    driver.findElement(By.id("register_10340")).click();
    // ERROR: Caught exception [ERROR: Unsupported command [getAllFields |  | ]]
    for (int second = 0;; second++) {
    	if (second >= 60) fail("timeout");
    	try { if (isAlertPresent()) break; } catch (Exception e) {}
    	Thread.sleep(1000);
    }

    try {
      assertTrue(isAlertPresent());
    } catch (Error e) {
      verificationErrors.append(e.toString());
    }
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
