package ca.objects;

import java.util.ArrayList;

public class Course
{
	private String courseID, courseName, faculty, dept, description;
	private int creditHrs;
	private boolean isFullYr;

	// probably want to be able to create a Course without all of these variables though
	public Course(String cID, String name, String fac, String dept, String desc, int crHrs, boolean fullYr)
	{
		courseID = cID;
		courseName = name;
		faculty = fac;
		this.dept = dept;
		description = desc;
		creditHrs = crHrs;
		isFullYr = fullYr;
	}

	public String getCourseID() {
		return courseID;
	}

	public void setCourseID(String courseID) {
		this.courseID = courseID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getFaculty() {
		return faculty;
	}

	public void setFaculty(String faculty) {
		this.faculty = faculty;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public int getCreditHrs() {
		return creditHrs;
	}

	public void setCreditHrs(int creditHrs) {
		this.creditHrs = creditHrs;
	}

	public boolean isFullYr() {
		return isFullYr;
	}

	public void setFullYr(boolean isFullYr) {
		this.isFullYr = isFullYr;
	}

	public String toString()
	{
		String result = "";

		result += courseID + " - " + courseName + "\n";
		result += "Faculty: " + faculty + " - Department: " + dept + "\n";
		result += "Credit Hours: " + creditHrs + "\n";
		result += "Description: " + description + "\n";
		if(isFullYr)
			result += "Length: Full Year\n";
		else
			result += "Length: 1 Term\n";

		return result;
	}

	public boolean dbInsert()
	{
		boolean success = false;

		return success;
	}

	public boolean dbUpdate()
	{
		boolean success = false;

		return success;
	}
}