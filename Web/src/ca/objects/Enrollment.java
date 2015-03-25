package ca.objects;



public class Enrollment 
{
	private int stuID;
	private String crn;
	private float grade;
	
	private Section section; //section this enrollment belongs to
	
	public Enrollment(int studentID, String crn, float grade, Section section) 
	{
		stuID = studentID;
		this.crn = crn;
		this.grade = grade;
		
		this.section = section;
	}
	
	public Section getSection()
	{
		return section;
	}
	
	public String getCRN() 
	{
		return crn;
	}
	
	public float getGrade() 
	{
		return grade;
	}

}
