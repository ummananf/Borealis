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

	public string getID()
	{
		return courseID;
	}

	public String toString
	{
		String result = "";

		result += courseID + " - " + courseName + "\n";
		result += "Faculty: " + faculty + " - Department: " + dept + "\n";
		result += "Credit Hours: " + creditHrs + "\n";
		result += "Description: " + desc + "\n";

		return result;
	}

	// TODO - write method to call something in the model to insert this Course record into the DB
	public boolean dbInsert
	{
		boolean success = false;

		return success;
	}

	// TODO - write method to call something in the model to update this Course record in the DB
	public boolean dbUpdate
	{
		boolean success = false;

		return success;
	}
}