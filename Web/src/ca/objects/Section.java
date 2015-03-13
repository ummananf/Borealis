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
		super(cID, name, fac, dept, desc, crHrs, false);
		sectID = sID;
		startTime = sTime;
		endTime = eTime;
		location = loc;
		this.maxSize = maxSize;
		this.tuition = tuition;
		daysOffered = days;
		
	}

	public String getID()
	{
		return sectID;
	}

	public String getCourse()
	{
		return super.getID();
	}

	public String toString()
	{
		String result = "";

		result += super.toString();
		result += "Section " + sectID + "\n";
		result += startTime + " - " + endTime + " on " + getDaysStr() + "\n";
		result += "Location: " + location + "\n";

		return result;
	}

	private String getDaysStr()
	{
		String result = "";
		final String[] DAYS = {"Mon", "Tues", "Wed", "Thur", "Fri", "Sat", "Sun"};

		for (int i = 0; i < 7; i++)
		{
			if (daysOffered[i] == true)
				result += DAYS[i] + ",";
		}

		// get rid of the comma at the end
		result = result.substring(0, result.length() - 1);
		return result;
	}

	// TODO - write method to call something in the model to insert this Section record into the DB
	public boolean dbInsert()
	{
		boolean success = false;

		return success;
	}

	// TODO - write method to call something in the model to update this Section record in the DB
	public boolean dbUpdate()
	{
		boolean success = false;

		return success;
	}
}