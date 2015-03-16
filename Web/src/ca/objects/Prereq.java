package ca.objects;

public class Prereq 
{

	private String courseID; //of course that requires others
	private String requiredCourseID;
	private float minGrade;
	
	public Prereq(String cID, String reqCID, float minGrade) 
	{
		courseID = cID;
		requiredCourseID = reqCID;
		this.minGrade = minGrade;
	}

	public String getCourseID()
	{
		return courseID;
	}

	public String getRequiredCourseID()
	{
		return requiredCourseID;
	}

	public float getMinGrade() 
	{
		return minGrade;
	}


}
