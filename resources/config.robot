*** Settings ***
Resource    ../resources/base.robot

*** Variables ***
${BASE_URL}    https://the-internet.herokuapp.com/
${TIMEOUT}     30


*** Keywords ***
SETUP
    Open Browser    ${BASE_URL}
    Maximize Browser Window
    
TIMEOUT
    Set Selenium Timeout    ${TIMEOUT}

TEARDOWN
    Close All Browsers

