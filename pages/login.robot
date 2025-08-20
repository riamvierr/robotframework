*** Variables ***
${LOGIN_INPUT_USERNAME}            id=username 
${LOGIN_INPUT_PASSWORD}            xpath=//input[@id='password']
${LOGIN_BTN_LOGIN}                 xpath=//button[contains(@type,'submit')]
${LOGIN_DIV_LOGIN_SECURE_AREA}     xpath=//div[contains(text(), 'You logged into a secure area')]
${LOGIN_DIV_USERNAME_INVALID}      xpath=//div[contains(text(), ' Your username is invalid!')]
${LOGIN_DIV_PASSWORD_INVALID}      xpath=//div[contains(text(), ' Your password is invalid!')]