package ca.servlets;

//Import required java libraries
import java.io.*;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.*;

import ca.objects.*;
import ca.logic.Profile_BO;

//Extend HttpServlet class
public class Login extends HttpServlet {

	private static final long serialVersionUID = 102831973239L;
	
	public static final String CURRENT_SESSION_USER = "CURRENT_SESSION_USER";
	
	/**
	 * doGet is logic that should be done before the page is rendered
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
  	     
		RequestDispatcher view = req.getRequestDispatcher("index.jsp");
		view.forward(req, res);	     

	}
	
	
	/**
	 * doPost is logic that should be done after a button is clicked
	 */
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{
		System.out.println("POSTED");
		
	    User user = new User( req.getParameter( "username" ), req.getParameter( "password" ));
	    Profile_BO aBO = new Profile_BO( user );
	
	     if (aBO.isValid())
	     {
	          HttpSession session = req.getSession(true);	    
	          session.setAttribute(CURRENT_SESSION_USER, aBO.getUser() ); 

	          res.sendRedirect("main");
	     }
		        
	     else{ 
	          res.sendRedirect("invalidLogin_throwaway.jsp");
	     }
	
	}
	
	public void destroy()
	{
	   // do nothing.
	}
	
}