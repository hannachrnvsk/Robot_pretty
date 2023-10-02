*** Settings ***
Library    RequestsLibrary


*** Keywords ***
Send GET Request
	[Arguments]    ${url}
	${response}=  GET    ${url}