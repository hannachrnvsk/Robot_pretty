*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_API}  http://10.10.14.3:8000/


*** Keywords ***
Initialize Session
    [Arguments]    ${session_alias}    ${url}=${BASEAPI}
    Create Session    ${session_alias}    ${url}

Send GET Request
	[Arguments]    ${session_alias}  ${url}
	${endpoint}=  Catenate    SEPARATOR=  ${BASE_API}  ${url}
	${response}=  GET On Session    ${session_alias}  ${endpoint}
	Status Should Be    200  ${response}
	[Return]    ${response}


Send POST Request With Valid Data
	[Arguments]    ${session_alias}  ${url}  ${data}
	${endpoint}=  Catenate    SEPARATOR=  ${BASE_API}  ${url}
	${response}=  POST On Session  ${session_alias}  ${endpoint}  json=${data}
	Status Should Be    200  ${response}
	[Return]    ${response}
