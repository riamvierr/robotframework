*** Settings ***
Resource           ../resources/base.robot
Test Setup         SETUP
Test Teardown      TEARDOWN

*** Test Cases ***
CT-001: [Login] - Successfully login
    [Tags]    CT-001    riam.lima
    Given a user in login page
    When the user insert his credentials    valid
    And press the login button
    Then the page must show a message based on user type of operaction

CT-002: [Login] - Failed login 
    [Tags]    CT-002    riam.lima
    Given a user in login page
    When the user insert his credentials    invalid 
    And press the login button
    Then the page must show a message based on user type of operaction

CT-003: [Login] - Failed login by invalid username
    [Tags]    CT-003    riam.lima
    Given a user in login page
    When the user insert his credentials    invalid username
    And press the login button
    Then the page must show a message based on user type of operaction

CT-004: [Login] - Failed login by invalid password
    [Tags]    CT-004    riam.lima
    Given a user in login page
    When the user insert his credentials    invalid password
    And press the login button
    Then the page must show a message based on user type of operaction