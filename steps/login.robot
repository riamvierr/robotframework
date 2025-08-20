*** Settings ***
Resource    ../resources/base.robot

*** Keywords ***
# --- GIVEN --- #
a user in login page
    clicar em um elemento visível    ${HOMEPAGE_A_URL_LOGIN}
    Wait Until Element Is Visible    ${LOGIN_INPUT_USERNAME}

# --- WHEN --- #
the user insert his credentials
    [Documentation]    A user must insert only one of four next option for the type of operaction [valid, invalid, invalid username, invalid password]. The user doesn't need to put any inputs of usernames or password, this options is completely optional.  
    [Arguments]    ${type}=valid    ${username}=${login.valid_user}    ${password}=${login.valid_password}
    Set Global Variable    ${type}
    IF    '${type}' == 'valid'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${username}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${password}
    ELSE IF  '${type}' == 'invalid'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${login.invalid_user}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${login.invalid_password}
    ELSE IF  '${type}' == 'invalid username'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${login.invalid_user}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${password}
    ELSE IF  '${type}' == 'invalid password'
        inserir texto em um elemento visível    ${LOGIN_INPUT_USERNAME}    ${username}
        inserir texto em um elemento visível    ${LOGIN_INPUT_PASSWORD}    ${login.invalid_password}
    END


# --- THEN --- #
the page must show a message based on user type of operaction
    IF    '${type}' == 'valid'
        Wait Until Element Is Visible    ${LOGIN_DIV_LOGIN_SECURE_AREA}
    ELSE IF  '${type}' == 'invalid'
        Wait Until Element Is Visible    ${LOGIN_DIV_USERNAME_INVALID}
    ELSE IF  '${type}' == 'invalid username'
        Wait Until Element Is Visible    ${LOGIN_DIV_USERNAME_INVALID}
    ELSE IF  '${type}' == 'invalid password'
        Wait Until Element Is Visible    ${LOGIN_DIV_PASSWORD_INVALID}
    END

# --- AND --- #
press the login button
    clicar em um elemento visível    ${LOGIN_BTN_LOGIN}