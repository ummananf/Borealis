package ca.servlets;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ca.logic.Profile_BO;
import ca.objects.User;

public class Main extends HttpServlet {

	private static final long serialVersionUID = 102831983239L;
	
	public static final String CURRENT_SESSION_USER = "CURRENT_SESSION_USER";
	
	
	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		
		RequestDispatcher view = req.getRequestDispatcher("main.jsp");
		view.forward(req, res);	 
		
	}
	
	
	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{

		//post data and links
	
	}
	
	public void destroy()
	{
	   // do nothing.
	}
	
}
