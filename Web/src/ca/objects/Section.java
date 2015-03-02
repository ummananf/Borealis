package ca.objects;

public class Section extends Course
{
	private String sectID, startTime, endTime, location;
	private int maxSize;
	private float tuition;
	private boolean[] daysOffered;

	// probably want to be able to create a Section without all of these variables though
	public Section(String cID, String name, String fac, String dept, String desc,
		int crHrs, String sID, String sTime, String eTime, String loc, int maxSize,
		float tuition, boolean[] days)
	{
		sectID = sID;
		startTime = sTime;
		endTime = eTime;
		location = loc;
		this.maxSize = maxSize;
		this.tuition = tuition;
		daysOffered = days;
		super(cID, name, fac, dept, desc, crHrs);
	}

	// TODO - create a section from DB data
	public Section(ResultSet data)
	{
	}

	public String getID()
	{
		return sectID;
	}

	public String getCourse()
	{
		return super.getID();
	}
}