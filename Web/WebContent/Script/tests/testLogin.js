
describe("Test Front end login logic", function()
{
   
  it('should not allow user to enter non English or non number chacter as the user name', function() {
	  view.render();
	  var form = $('#login_form');
	  var submitCallback = jasmine.createSpy().andReturn(false);
	  form.submit(submitCallback);

	  $('#submit_btn').click();

	  expect(form.attr('action')).toEqual('/login');
	  expect($('#username').attr('value')).toEqual('1');// TODO
	  expect(submitCallback).toHaveBeenCalled();
	});
});




