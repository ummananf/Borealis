package ca.objects;

import java.sql.Time;
import java.util.ArrayList;

public class Section
{
	private String crn, sectID, cID, days, location, termStart;
	private int maxSize;
	private Time startTime, endTime;
	
	private ArrayList<Enrollment> enrollments;
	private Course course; //the course this section belongs to
	
	public Section(String crn, String sectID, String cID, String termStart, int maxSize,
			String days, Time startTime, Time endTime, String location, Course course) 
	{
		this.crn = crn;
		this.sectID = sectID;
		this.cID = cID;
		this.termStart = termStart;
		this.maxSize = maxSize;
		this.days = days;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
		
		enrollments = new ArrayList<Enrollment>();
		this.course = course;
	}
	
	
	public void addEnrollment(Enrollment enroll)
	{
		enrollments.add(enroll);
	}
	
	public ArrayList<Enrollment> getEnrollments()
	{
		return enrollments;
	}
	
	public Course getCourse()
	{
		return course;
	}

	public String getCrn()
	{
		return crn;
	}

	
	public String getSectID() 
	{
		return sectID;
	}

	public void setSectID(String sectID) 
	{
		this.sectID = sectID;
	}

	public String getCourseID() 
	{
		return cID;
	}

	public void setCourseID(String cID) 
	{
		this.cID = cID;
	}

	public String getDays() 
	{
		return days;
	}

	public void setDays(String days) 
	{
		this.days = days;
	}

	public String getLocation() 
	{
		return location;
	}

	public void setLocation(String location) 
	{
		this.location = location;
	}

	public String getTermStart() 
	{
		return termStart;
	}

	public void setTermStart(String termStart) 
	{
		this.termStart = termStart;
	}

	public int getMaxSize() 
	{
		return maxSize;
	}

	public void setMaxSize(int maxSize) 
	{
		this.maxSize = maxSize;
	}

	public Time getStartTime() 
	{
		return startTime;
	}

	public void setStartTime(Time startTime) 
	{
		this.startTime = startTime;
	}

	public Time getEndTime() 
	{
		return endTime;
	}

	public void setEndTime(Time endTime) 
	{
		this.endTime = endTime;
	}

	public String getID() 
	{
		return sectID;
	}

}