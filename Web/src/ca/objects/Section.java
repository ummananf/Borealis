package ca.objects;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Section extends Course {
	
/*	
	private String sectID, startTime, endTime, location;
	private int maxSize;
	private boolean[] daysOffered;

	// probably want to be able to create a Section without all of these
	// variables though
	public Section(String cID, String name, String fac, String dept,
			String desc, int crHrs, String sID, String sTime, String eTime,
			String loc, int maxSize, float tuition, boolean[] days,
			boolean isFullYr) {
		super(cID, name, fac, dept, desc, crHrs, isFullYr);

		sectID = sID;
		startTime = sTime;
		endTime = eTime;
		location = loc;
		this.maxSize = maxSize;
		daysOffered = days;

	}
*/
	
	private String sectID, crn, cID, days, location;
	private Date termStart;
	private int maxSize;
	private Time startTime, endTime;
	
	public Section(String crn, String sectID, String cID, Date termStart, int maxSize,
			String days, Time startTime, Time endTime, String location) {
		super(null, null, null, null, null, 0, false);
		
		this.crn = crn;
		this.sectID = sectID;
		this.cID = cID;
		this.termStart = termStart;
		this.maxSize = maxSize;
		this.days = days;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
	}
	


	public Section(String sectID,String crn, String cID,String courseName, Date termStart, int maxSize,
			String days, Time startTime, Time endTime, String location) {
		super(cID, courseName, null, null, null, 0, false);
		this.sectID = sectID;
		this.crn = crn;
		this.termStart = termStart;
		this.maxSize = maxSize;
		this.days = days;
		this.startTime = startTime;
		this.endTime = endTime;
		this.location = location;
	}

	public String getCrn() {
		return crn;
	}

	
	public String getSectID() {
		return sectID;
	}

	public void setSectID(String sectID) {
		this.sectID = sectID;
	}

	public String getcID() {
		return cID;
	}

	public void setcID(String cID) {
		this.cID = cID;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Date getTermStart() {
		return termStart;
	}

	public void setTermStart(Date termStart) {
		this.termStart = termStart;
	}

	public int getMaxSize() {
		return maxSize;
	}

	public void setMaxSize(int maxSize) {
		this.maxSize = maxSize;
	}

	public Time getStartTime() {
		return startTime;
	}

	public void setStartTime(Time startTime) {
		this.startTime = startTime;
	}

	public Time getEndTime() {
		return endTime;
	}

	public void setEndTime(Time endTime) {
		this.endTime = endTime;
	}

	public String getID() {
		return sectID;
	}
	
	
	
/* error here
	public String getCourse() {
		return super.getID();
	}
*/
	
	
	
	/*
	public String toString() {
		String result = "";

		result += super.toString();
		result += "Section " + sectID + "\n";
		result += startTime + " - " + endTime + " on " + getDaysStr() + "\n";
		result += "Location: " + location + "\n";

		return result;
	}
	*/
	
	
	
/*
	private String getDaysStr() {
		String result = "";
		final String[] DAYS = { "Mon", "Tues", "Wed", "Thur", "Fri", "Sat",
				"Sun" };

		for (int i = 0; i < 7; i++) {
			if (daysOffered[i] == true)
				result += DAYS[i] + ",";
		}

		// get rid of the comma at the end
		result = result.substring(0, result.length() - 1);
		return result;
	}
*/
	
	
	// TODO - write method to call something in the model to insert this Section
	// record into the DB
	public boolean dbInsert() {
		boolean success = false;

		return success;
	}

	// TODO - write method to call something in the model to update this Section
	// record in the DB
	public boolean dbUpdate() {
		boolean success = false;

		return success;
	}
}