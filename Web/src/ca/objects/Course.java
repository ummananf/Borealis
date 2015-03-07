package ca.objects;

import java.util.ArrayList;

public class Course
{
	private String courseID, courseName, faculty, dept, description;
	private int creditHrs;
	private boolean isFullYr;
	private ArrayList<Section> sections;

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
		
		sections = new ArrayList<Section>();
	}

	public String getID()
	{
		return courseID;
	}

	public void addSection(Section section)
	{
		sections.add(section);
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

	// TODO - write method to call something in the model to insert this Course record into the DB
	public boolean dbInsert()
	{
		boolean success = false;

		return success;
	}

	// TODO - write method to call something in the model to update this Course record in the DB
	public boolean dbUpdate()
	{
		boolean success = false;

		return success;
	}
}