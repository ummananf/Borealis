package ca.logic;

import java.util.ArrayList;
import java.util.List;

import ca.objects.Enrollment;
import ca.objects.Prereq;
import ca.persistence.StudentModel;


public class RegistrationLogic {

	public RegistrationLogic() {}
	
	public boolean meetsPrereqs(int studentID, String courseID)
	{
		ArrayList<Enrollment> completedCourses = StudentModel.getCompletedCourses(studentID);
		ArrayList<Prereq> prereqs = StudentModel.getPrereqs(courseID);
		boolean allPrereqsMet = true; //start as true, so if no prereq, still true
		
		// TODO: make efficient SQL query instead of this?
		for(int i = 0; i < prereqs.size() && allPrereqsMet; i++)
		{
			Prereq p = prereqs.get(i);
			boolean currPrereqMet = false;
			
			for(Enrollment e : completedCourses)
			{
				if(p.getRequiredCourseID().equals(e.getCourseID()))
					if(e.getGrade() >= p.getMinGrade())
						currPrereqMet = true;
			}
			
			allPrereqsMet = currPrereqMet;
		}
		
		return allPrereqsMet;
	}
}
