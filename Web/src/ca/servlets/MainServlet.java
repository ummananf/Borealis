package ca.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ca.session.SessionGlobals;

public class MainServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		// Check if user has a session, if not, don't allow access
		if (req.getSession().getAttribute(SessionGlobals.CURRENT_SESSION_USER) != null) 
		{
			RequestDispatcher view = req.getRequestDispatcher("main.jsp");
			
			/****start of getting some JSON object to render the main page***/
			
			
			// activate the session through request
			HttpSession session = req.getSession(true);
			
			
			
			
			
			
			/***end of getting some JSON object to render the main page***/
			view.forward(req, res);
		} 
		else 
		{
			RequestDispatcher view = req
					.getRequestDispatcher("authRequired.jsp");
			view.forward(req, res);
		}

	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
	}
}
