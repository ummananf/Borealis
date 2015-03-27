describe("Course registering logic", function()
{
	beforeEach(function() {
		// Specify where to find jsp files
		jasmine.getFixtures().fixturesPath = '../../Script/tests/fixtures';
		loadFixtures('registerCoursesFixt.jsp');
	});

	it('Checks that the category selector has been filled in when term selector is changed', function() {
		
		//var obj = jasmine.createSpyObj('catSpy', ['populateCategories']);
		var selectCat = $('#category');
		
		// Set current term
		$('#term').val("winter2015");
		
		expect($('#category option').size()).toBe(1);
		expect($('#term').val()).toEqual("winter2015");

		// Create mock object for function to work with
		var jsonObj = [ {"degName":"Bio"},
		                {"degName":"Comp"} ];
		
		
		// Replace $.ajax with stub function
		$.ajax = function(opts) {
			var successCallback = opts.success;
			successCallback(jsonObj);
		};
		
		onTermChange(event);
		
		
		expect($('#category option[value="Comp"]').text()).toEqual("Comp");
		expect($('#category option:selected').text()).toEqual("Bio");
		expect($('#category option').size()).toEqual(2);
		expect(selectCat.val()).toEqual("Bio");
		
	});
});