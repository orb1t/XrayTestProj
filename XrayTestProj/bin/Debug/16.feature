@XRAYT0-1830
Feature: 

	
	@XRAYT0-1831
	Scenario Outline: Add two positive numbers
		Given I have entered <input_1> into the calculator
		And I have also entered <input_2> into the calculator
		When I press <button>
		Then the result should be <output> on the screen
		         
		Examples:
		    | input_1 | input_2 | button | output |
		    | 20      | 30      | add    | 50     |
		    | 2       | 5       | add    | 7      |
		    | 0       | 40      | add    | 40     |
		    | 4       | 50      | add    | 54     |
		    | 5       | 50      | add    | 55     |    	

	
	@XRAYT0-1832
	Scenario: add two numbers
		Given I have entered 50 into the calculator
		And I have also entered 70 into the calculator
		When I press add
		Then the result should be 120 on the screen	

	
	@XRAYT0-1833
	Scenario Outline: add two negative numbers
		Given I have entered <input_1> into the calculator
		And I have also entered <input_2> into the calculator
		When I press <button>
		Then the result should be <output> on the screen
		                     
		Examples:
		    | input_1 | input_2 | button | output |
		    | -1      | -2      | add    | -3     |
		    | 1       | -1      | add    | 0      |