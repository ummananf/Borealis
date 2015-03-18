
describe("Test Front end login logic", function()
{
	beforeEach(function() {
		// Specify where to find jsp files
		jasmine.getFixtures().fixturesPath = '../../Script/tests/fixtures';
	  });

  it('Should not allow user to enter non-valid characters in login form', function() {

	  loadFixtures('indexFixt.jsp'); //the one with login form
	  expect( $('#login_form')).toExist();
	  
	  // Spy on this so the actual method doesn't get executed
	  show_err_msg = jasmine.createSpy("showErrSpy");
	  
	  // Set invalid entry data on the form
	  $('#username').val("bob");
	  $('#password').val("");
	  
	  expect(validateForm()).toEqual(false);
	  expect(show_err_msg).toHaveBeenCalled();
	  
	  // Set valid entry data on the form
	  $('#username').val("bob");
	  $('#password').val("wrongpass");
	  
	  expect(validateForm()).toEqual(true);
	  expect(show_err_msg).toHaveBeenCalled();
	});
});




