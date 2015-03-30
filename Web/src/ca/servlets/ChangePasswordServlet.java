package ca.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ca.logic.ChangePasswordLogic;
import ca.objects.User;
import ca.session.SessionGlobals;


public class ChangePasswordServlet extends HttpServlet 
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		RequestDispatcher view = req.getRequestDispatcher("changePassword.jsp");
		
		view.forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		HttpSession session = req.getSession(true);
		// before we call the model to get enrollment records from the db, we need to know the userID
		User student = (User)session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		
		int userID = student.getUserID();
		
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");
		
		ChangePasswordLogic changePasswordLogic = new ChangePasswordLogic(newPassword,oldPassword,userID);
		
		 res.setContentType("text/html");
		 PrintWriter out = res.getWriter();
		 	
		if(changePasswordLogic.changePassword())
		{
			out.append("password has been changed");
		}
		else
		{
			out.append("password has not been changed");
		}
		res.setStatus(HttpServletResponse.SC_OK);
	}
}
