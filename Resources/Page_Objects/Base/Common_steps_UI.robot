*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BASE_URL} =  http://10.10.14.9/
${COOKIE_TAB} =  //*[@id="root"]/div/div
${COOKIE_CROSS} =  //*[@class='absolute top-4 right-4 text-xl cursor-pointer']
${ACCEPT_COOKIE_BUTTON} =  //button[text()="Accept cookies"]

*** Keywords ***
Open Main Page In Browser
	Set Selenium Implicit Wait    5
    Open Browser  ${BASE_URL}  chrome  options=add_argument('start-maximized')

End Browser Session
    Close All Browsers

Close Cookie Tab
    Element Should Be Visible  ${COOKIE_TAB}
    Click Element  ${COOKIE_CROSS}

Accept Cookie
    Element Should Be Visible  ${COOKIE_TAB}
    Click Element  ${ACCEPT_COOKIE_BUTTON}
