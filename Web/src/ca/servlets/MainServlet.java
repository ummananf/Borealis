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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import ca.logic.TermLogic;
import ca.objects.Enrollment;
import ca.objects.Term;
import ca.objects.User;
import ca.persistence.EnrollmentModel;
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
			int numCoursesRegistered = 0;
			
			
			JsonObject obj = new JsonObject();
			obj.addProperty("numCoursesRegistered", numCoursesRegistered);
			obj.addProperty("www", 123213);
			obj.addProperty("ddf", "eee");
			
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
