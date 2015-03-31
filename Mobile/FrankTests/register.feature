Feature: Register for courses

Scenario: Registering for courses
Given I launch the app
Then I should be at the Log In Screen

When I log in
Then I should be at Home Screen

When I navigate to "Register Courses"
Then I should be at Register Courses Screen

When I touch Winter 2015
Then I should see a list for Category

When I touch Computer Science
Then I should see a list of courses

When I register for COMP1010
Then I should see an alert