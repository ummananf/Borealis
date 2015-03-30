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

import ca.logic.TermLogic;
import ca.objects.Enrollment;
import ca.objects.Term;
import ca.objects.User;
import ca.persistence.StudentModel;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

public class GradeServlet extends HttpServlet 
{	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		RequestDispatcher view = req.getRequestDispatcher("grade.jsp");
		
		view.forward(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		int userID = user.getUserID();
		//String currTermID = req.getParameter("termID");
		
		// Create an ArrayList to hold Enrollment Records
		ArrayList<Enrollment> enrollments = new ArrayList<Enrollment>();

		
		enrollments = StudentModel.getCompletedEnrollments(userID);
		
		// start to converting object to json....
		JsonElement element = new Gson().toJsonTree(enrollments, new TypeToken<ArrayList<Enrollment>>() {}.getType());
		
		// final conversion
		JsonArray enrollmentInfo = element.getAsJsonArray();
		
		// Tell servlet that we are sending JSON
		res.setContentType("application/json");
		
		res.getWriter().print(enrollmentInfo);

	}
}
