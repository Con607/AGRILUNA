Feature: Companies page

	Scenario: Viewing application's companies
	    Given there's a company named "First Company" with "Hello, BDD world!" description
	    When I am on the companies index
	    Then I should see the "First Company" company