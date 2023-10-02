*** Settings ***
Library  SeleniumLibrary
Resource  Base/Common_steps_UI.robot

*** Variables ***
${LOGIN_PAGE_LINK} =  http://10.10.14.9/login
${EMAIL_FIELD_LOC} =  //input[@id="email"]
${PASSWORD_FIELD_LOC} =  //input[@id="password"]
${SUBMIT_LOGIN_BUTTON_LOC} =  //button[@type="submit"]

*** Keywords ***
Open Login Page
    Go To  ${LOGIN_PAGE_LINK}
    Wait Until Page Contains  Log in to PRetty Online Banking

Enter Email Address
    [Arguments]  ${EMAIL}
    ${email_field_el}=  Get Webelement    ${EMAIL_FIELD_LOC}
    Element Should Be Visible  ${email_field_el}
    Input Text  ${email_field_el}  ${EMAIL}

Enter Password
    [Arguments]  ${PASSWORD}
    ${password_field_el}=  Get Webelement    ${PASSWORD_FIELD_LOC}
    Element Should Be Visible  ${password_field_el}
    Input Text  ${password_field_el}  ${PASSWORD}

Confirm Login
	${login_button_el}=  Get Webelement    ${SUBMIT_LOGIN_BUTTON_LOC}
    Element Should Be Visible  ${login_button_el}
    Click Element  ${login_button_el}







