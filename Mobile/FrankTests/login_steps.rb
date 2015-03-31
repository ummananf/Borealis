Then /^I should be at the Log In Screen$/ do
	check_element_exists "view:'ViewController' view:'UITextField' marked:'username'"
	check_element_exists "view:'ViewController' view:'UITextField' marked:'password'"
	check_element_exists "view:'ViewController' view:'UIButton' marked:'Log In'"
end

When /^I log in$/ do
	fill_in 'username', :with => 'bob'
	fill_in 'password', :with => '4350'
	touch "view:'UIButton' marked:'Log In'"
end

Then /^I should be at Home Screen$/ do
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'My Information'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Username'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Name'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Student ID'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'E-mail'"
	check_element_exists "view:'MyInfoViewController' view:'UILabel' marked:'Degree'"
end