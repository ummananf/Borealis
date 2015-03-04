package ca.objects;


public class Course
{
	private String courseID, courseName, faculty, dept, description;
	private int creditHrs;

	// probably want to be able to create a Course without all of these variables though
	public Course(String cID, String name, String fac, String dept, String desc, int crHrs)
	{
		courseID = cID;
		courseName = name;
		faculty = fac;
		this.dept = dept;
		description = desc;
		creditHrs = crHrs;
	}

	public String getID()
	{
		return courseID;
	}
}