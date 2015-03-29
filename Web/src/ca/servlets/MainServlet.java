package ca.servlets;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import ca.objects.User;
import ca.persistence.StudentModel;
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
			
			
			// activate the session through request
			HttpSession session = req.getSession(true);
			
			User student = (User)session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);	
			int userID = student.getUserID();
			
			// The following attributes are the information we need to render the main page
			
			JsonObject obj = new JsonObject();
			
			
			int winter2015CreditHours = StudentModel.getNumCreditHrsRegistered(userID, "Winter2015");
			int fall2014CreditHours = StudentModel.getNumCreditHrsRegistered(userID, "Fall2014");
			
			obj.addProperty("winter2015CreditHours", winter2015CreditHours);
			obj.addProperty("fall2014CreditHours", fall2014CreditHours);
			
			
			
			/*obj.addProperty("numCoursesRegistered", numCoursesRegistered);*/
			
			session.setAttribute("otherInfo", obj);
			res.setContentType("application/json");
			
			res.getWriter().print(obj);
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
