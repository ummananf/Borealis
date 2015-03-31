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

When /^I navigate to "Register Courses"$/ do
	touch "view:'UIButton' marked:'Register Courses'"
end

Then /^I should be at Register Courses Screen$/ do
	check_element_exists "view:'RegisterViewController' view:'UILabel' marked:'Term:'"
	check_element_exists "view:'RegisterViewController' view:'UILabel' marked:'Category:'"
	check_element_exists "view:'RegisterViewController' view:'UITableView' marked:'courseTable'"
end

When /^I touch Winter 2015$/ do
	touch "view:'UISegmentedControl' marked:'termControl:Winter 2015'"
end

Then /^I should see a list for Category$/ do
	check_element_exists "view:'RegisterViewController' view:'UISegmentedControl' marked:'categoryControl'"
end

When /^When I touch Computer Science$/ do
	touch "view:'UISegmentedControl' marked:'categoryControl:Computer Science$/'"
end

Then /^I should see a list of courses$/ do
	check_element_exists "view:'RegisterViewController' view:'TableVeiwCell' marked:'COMP1010'"
end

When /^I register for COMP1010$/ do
	touch "view:'RegisterViewController' view:'UITableVeiw' view:'TableVeiwCell' marked:'COMP1010' view:'UIButton' marked:'registerClicked'"
end

Then /^I should see an alert$/ do
	check_element_exists "view:'RegisterViewController' view:'UIAlertView' marked:'Successfully registered!'"
end