*** Settings ***
Resource    ../resources/base.robot

*** Keywords ***
clicar em um elemento visível
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Click Element    ${element}

inserir texto em um elemento visível
    [Arguments]    ${element}    ${text}
    Wait Until Element Is Visible    ${element}
    Input Text    ${element}    ${text}