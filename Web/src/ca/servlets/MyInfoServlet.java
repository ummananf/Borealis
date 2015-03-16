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

import ca.objects.Student;
import ca.objects.User;
import ca.persistence.UserModel;


public class MyInfoServlet extends HttpServlet 
{


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
		System.out.println("**** MADE IT TO   __" + this.getServletName() + "__ ****");
		
		HttpSession session = req.getSession(true);
		
		// create a list of users, actually we assume all users are students for now. It would be convenient for gson to analyze if we create a list here
		ArrayList<User> students = new ArrayList<User>();
		
		
		// get the model from DB
		User student = (User)session.getAttribute(SessionGlobals.CURRENT_SESSION_USER);
		String name = student.getUsername();
				
		
		students.add(student);
		
		Gson gsonStudent = new Gson();
		
		JsonElement element = gsonStudent.toJsonTree(students, new TypeToken<ArrayList<Student>>() {}.getType());
		
		JsonArray myInfo = element.getAsJsonArray();
		
		req.setAttribute("studentInfo", myInfo);

		res.setContentType("application/json");
		res.getWriter().print(myInfo);
		
		session.setAttribute("studentInfo", myInfo);
		
		
		RequestDispatcher view = req.getRequestDispatcher("myInfo.jsp");
		view.forward(req, res);

	}


	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException 
	{
		
	}
}
