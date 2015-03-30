describe("Letter grade", function()
{
	it("correctly executes switch statement to get letter grade", function()
	{
		var grade = getLetterGrade(4.5);

		expect(grade).toEqual("A+");
	});

	it("uses n/a for invalid grade values", function()
	{
		var grade = getLetterGrade(-3.5);

		expect(grade).toEqual("n/a");
	});
});