*** Settings ***
Resource    Base/Base_API.robot

*** Variables ***
${LOGIN_URL}  api/auth/token/
${GET_LOANS}  api/loans
${session_alias}  authorized_session

*** Keywords ***
Authorize User
	[Arguments]    ${user_data}
	Initialize Session  ${session_alias}
	Send POST Request With Valid Data    ${session_alias}  ${LOGIN_URL}  ${user_data}

Get Info About Loans
	Send GET Request    ${session_alias}  ${GET_LOANS}

