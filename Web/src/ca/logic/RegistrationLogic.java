package ca.logic;

import java.util.ArrayList;

import ca.objects.Course;
import ca.objects.Enrollment;
import ca.objects.Prereq;
import ca.objects.RegisterResponse;
import ca.objects.Section;
import ca.objects.Student;
import ca.objects.User;
import ca.persistence.CourseModel;
import ca.persistence.SectionModel;
import ca.persistence.StudentModel;
import ca.persistence.UserModel;


public class RegistrationLogic 
{

	public RegistrationLogic() {}
	
	
	// Should check that studentID is in fact valid studentID prior to this
	public boolean meetsPrereqs(int studentID, String courseID)
	{
		ArrayList<Enrollment> completedEnrollments = StudentModel.getCompletedEnrollments(studentID);
		ArrayList<Prereq> prereqs = CourseModel.getPrereqs(courseID);
		boolean allPrereqsMet = true; //start as true, so if no prereq, still true
		
		for(int i = 0; i < prereqs.size() && allPrereqsMet; i++)
		{
			Prereq p = prereqs.get(i);
			boolean currPrereqMet = false;
			
			for(Enrollment enrol : completedEnrollments)
			{
				if(p.getRequiredCourseID().equals(enrol.getSection().getCourseID()))
					if(enrol.getGrade() >= p.getMinGrade())
						currPrereqMet = true;
			}
			
			allPrereqsMet = currPrereqMet;
		}
		
		return allPrereqsMet;
	}
	
	
	// Check if user allowed to register for the given section (given by crn)
	public RegisterResponse canRegister(int userID, String crn)
	{
		RegisterResponse response = RegisterResponse.SUCCESS;
		User user = UserModel.getUserByID(userID);
		Section sect = SectionModel.getSectionByCRN(crn);
		Course course = CourseModel.getCourseByID(sect.getCourseID());
		
		Student student = (Student)user;
		String currTerm = sect.getTermStart();
		
		if( !(user.getType().equals("student") ) )
		{
			response = RegisterResponse.FAIL_NON_STUDENT;
		}
		else if(StudentModel.getNumCreditHrsRegistered(userID, currTerm) + course.getCreditHrs() > student.getMaxCreditsPerTerm())
		{
			response = RegisterResponse.FAIL_MAX_CR_HRS_REACHED;
		}
		else if(!meetsPrereqs(userID, course.getCourseID()) )
		{
			response = RegisterResponse.FAIL_PREREQ_NOT_MET;
		}
		
		// TODO: check that not already registered in diff sect of same course
		
		System.out.println("hours reg'd: " + StudentModel.getNumCreditHrsRegistered(userID, currTerm));
		System.out.println("course creds: " + course.getCreditHrs());
		System.out.println("students max: " + student.getMaxCreditsPerTerm());
		
		return response;
	}
	
	
	public String getRegistrationErrorMessage(RegisterResponse response)
	{
		String msg = "";
		
		switch(response)
		{
		case FAIL_NON_STUDENT:
			msg = "Only students may register for courses.";
			break;
		case FAIL_MAX_CR_HRS_REACHED:
			msg = "You have reached your maximum credit hour limit for this term.";
			break;
		case FAIL_PREREQ_NOT_MET:
			msg = "You do not meet the prerequisites to register for this course.";
			break;
		case FAIL_SAME_COURSE:
			msg = "You are already registered for this course in a different section.";
			break;
		}
		
		return msg;
	}
	
}
