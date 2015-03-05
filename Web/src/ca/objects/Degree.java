package ca.objects;

public class Degree
{
	private String degName, degProgram, degOption;
	private int creditHrs;

	// create Degree with less variables?
	public Degree(String name, String program, String option, int crHrs)
	{
		degName = name;
		degProgram = program;
		degOption = option;
		creditHrs = crHrs;
	}

	public String toString
	{
		String result = "";

		result += "Degree: " + degName + "(" + creditHrs + " credit hours)\n";
		result += degProgram + " - " + degOption + "\n";

		return result;
	}

	// TODO - write method to call something in the model to insert this Degree record into the DB
	public boolean dbInsert
	{
		boolean success = false;

		return success;
	}

	// TODO - write method to call something in the model to update this Degree record in the DB
	public boolean dbUpdate
	{
		boolean success = false;

		return success;
	}
}