package ca.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ca.objects.User;
import ca.persistence.DB;

public class RegisterDropCourseServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		String userId = String.valueOf(user.getUserID());
		String action = req.getParameter("action");
		String crn = req.getParameter("crn");
		
		System.out.println("RegisterDropCourseServlet: " + userId + " " + action + " " + crn);
		String test = 
				"INSERT INTO Enrolled VALUES (" 
			      + userId + ",'" + crn + "', NULL);";
System.out.println(test);
		String query;
		boolean actionSuccessful = false;
		
		if (action.equals("register")) 
		{
			
			query = 
			"INSERT INTO Enrolled VALUES (" + userId + ",'" + crn + "', NULL);";
	
			actionSuccessful = DB.execute(query);
	
		} 
		else if (action.equals("drop")) 
		{	
			query = "DELETE FROM Enrolled WHERE userID='" + userId + "' AND crn='" + crn + "';";
			
			actionSuccessful = DB.execute(query);
		}
		
		if (actionSuccessful) 
		{
			res.setStatus(HttpServletResponse.SC_OK);
		}
		 else 
		{
			res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action unsuccessful.");
		}
	}
}
