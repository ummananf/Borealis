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

	// TODO - create a section from DB data
	public Section(ResultSet data)
	{
	}
}