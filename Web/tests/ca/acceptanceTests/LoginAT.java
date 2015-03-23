package ca.acceptanceTests;

import java.util.regex.Pattern;
import java.util.concurrent.TimeUnit;

import org.junit.*;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import org.openqa.selenium.*;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.support.ui.Select;

public class LoginAT {
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
  public void testSuccessLogin() throws Exception {
    driver.get(baseUrl + "/Borealis-Web/login");
    driver.findElement(By.id("username")).clear();
    driver.findElement(By.id("username")).sendKeys("bob");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("4350");
    driver.findElement(By.id("submit_btn")).click();
    try {
      assertTrue(driver.getCurrentUrl().matches("^[\\s\\S]*Borealis-Web/main$"));
    } catch (Error e) {
      verificationErrors.append(e.toString());
    }
  }
  
  @Test
  public void testUnsuccessfulLogin() throws Exception {
    driver.get(baseUrl + "/Borealis-Web/login");
    driver.findElement(By.id("username")).clear();
    driver.findElement(By.id("username")).sendKeys("bob");
    driver.findElement(By.id("password")).clear();
    driver.findElement(By.id("password")).sendKeys("0534");
    driver.findElement(By.id("submit_btn")).click();
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
