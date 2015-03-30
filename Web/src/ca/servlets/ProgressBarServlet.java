package ca.servlets;

import java.io.IOException;
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
import com.google.gson.reflect.TypeToken;

import ca.objects.Course;
import ca.objects.Degree;
import ca.objects.Enrollment;
import ca.objects.Student;
import ca.objects.User;
import ca.persistence.DegreeModel;
import ca.persistence.StudentModel;
import ca.session.SessionGlobals;


public class ProgressBarServlet extends HttpServlet 
{

	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		RequestDispatcher view = req.getRequestDispatcher("progressBar.jsp");
		
		// activate the session
		HttpSession session = req.getSession(true);
		
		// get the current user model from session
		Student student = (Student)session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		int userID = student.getUserID();
		
		String degreeName = student.getDegName();
		
	/***************************************************************************/	
		
		ArrayList<Course> degreeCourses = DegreeModel.getDegreeCourses(degreeName);
		
		Gson gsonDegreeCourses = new Gson();
		
		JsonElement element = gsonDegreeCourses.toJsonTree(degreeCourses, new TypeToken<ArrayList<Course>>() {}.getType());
		
		JsonArray degreeCoursesArray = element.getAsJsonArray();
		
	/******************************************************************************/
		
		ArrayList<Degree> degreeInfos = new ArrayList<Degree>();
		
		degreeInfos.add(DegreeModel.getDegreeInfo(degreeName));
		
		Gson gsonDegree = new Gson();
		
		JsonElement degreeElement = gsonDegree.toJsonTree(degreeInfos, new TypeToken<ArrayList<Degree>>() {}.getType());
		
		JsonArray degreeArray = degreeElement.getAsJsonArray();
		
   /*******************************************************************************/
		
		ArrayList<Enrollment> completedEnrollments = StudentModel.getCompletedEnrollments(userID);
		
		Gson gsonCompletedEnrollment = new Gson();
		
		JsonElement completedEnrollmentsElement = gsonCompletedEnrollment.toJsonTree(completedEnrollments, new TypeToken<ArrayList<Degree>>() {}.getType());
		
		
		JsonArray completedEnrollmentArray = completedEnrollmentsElement.getAsJsonArray();
		
		
		
		
		
		
		res.setContentType("application/json");
		res.getWriter().print(degreeArray);
		res.getWriter().print(degreeCoursesArray);
		res.getWriter().print(completedEnrollmentArray);
		
		session.setAttribute("degreeCourses", degreeCoursesArray);
		session.setAttribute("degreeInfo", degreeArray);
		session.setAttribute("completedEnrollments", completedEnrollmentArray);
		
		view.forward(req, res);
	}


	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
	}
}
