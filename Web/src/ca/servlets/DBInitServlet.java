package ca.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		 res.sendRedirect("/pages/index.jsp");

	}

}
