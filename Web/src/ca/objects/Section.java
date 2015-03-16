package ca.objects;

import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;

public class Section extends Course 
{
	
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
	
	public boolean dbInsert() {
		boolean success = false;

		return success;
	}

	public boolean dbUpdate() {
		boolean success = false;

		return success;
	}
}