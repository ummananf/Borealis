package ca.servlets;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ca.persistence.ConnectionManager;
import ca.persistence.DB;

@SuppressWarnings("serial")
public class DBInitServlet extends HttpServlet {
	
	/**
	 * This is the starting point when we are connecting to the website.
	 * Here we will create the tables, and then redirect to the Login servlet.
	 * Right now it is also used for testing - does not redirect to login.
	 * NOTE: every time the app starts here, tables and values are added to your connected schema
	 */
	@Override
	public void init() {
		
		DB.init();
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
//		String message = "???";
//		
//		DB.execute("CREATE TABLE TestTable (string CHAR(10));");
//		DB.execute("INSERT INTO TestTable (string) VALUES ('hello');");
//		Object[][] data = DB.executeQuery("SELECT * FROM TestTable;");
//		if (data != null) {
//			message = data[0][0].toString();
//		}
//		DB.execute("DROP TABLE TestTable;");
//  
//	      // Set response content type
//	      res.setContentType("text/html");
//
//	      // Actual logic goes here.
//	      PrintWriter out = res.getWriter();
//	      out.println("<h1>" + message + "</h1>");
		
		 res.sendRedirect("/Borealis-Web/login");

	}

}
