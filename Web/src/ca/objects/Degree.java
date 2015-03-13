package ca.objects;

import java.sql.ResultSet;

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
	
	public String getDegName() {
		return degName;
	}

	public String getDegProgram() {
		return degProgram;
	}

	public String getDegOption() {
		return degOption;
	}

	public int getCreditHrs() {
		return creditHrs;
	}
	
	public String toString()
	{
		String result = "";

		result += "Degree: " + degName + "(" + creditHrs + " credit hours)\n";
		result += degProgram + " - " + degOption + "\n";

		return result;
	}

}

