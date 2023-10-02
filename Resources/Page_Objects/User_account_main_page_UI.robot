
*** Settings ***
Library  SeleniumLibrary  implicit_wait=5

*** Variables ***
${CARDS} =  //nav/ul[1]/li[2]
${NAV_BAR} =  //*[@id="root"]/main/div[1]/nav/ul[1]
${MAIN_BUTTON} =  //nav/ul[1]/li[1]


*** Keywords ***
Verify User Account Main Page Appeared
    Element Should Contain  ${MAIN_BUTTON}  Main
    Element Should Be Visible    ${NAV_BAR}

Open Cards Tab
	Element Should Be Visible  ${CARDS}
	Element Text Should Be    ${CARDS}  Cards
	Click Element    ${CARDS}
