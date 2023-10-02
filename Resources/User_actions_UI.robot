*** Settings ***
Resource  Page_Objects/Login_page_UI.robot
Resource  Page_Objects/Base/Common_steps_UI.robot
Resource  Page_Objects/User_account_main_page_UI.robot
Resource  Page_Objects/Cards_page_UI.robot


*** Keywords ***
Log In User
    [Arguments]  ${EMAIL}  ${PASSWORD}
    Common_steps.Open Main Page In Browser
    Common_steps.Accept Cookie
    Login_page.Open Login Page
    Login_page.Enter Email Address  ${EMAIL}
    Login_page.Enter Password  ${PASSWORD}
    Login_page.Confirm Login
    User_account_main_page.Verify User Account Main Page Appeared

Open Cards Tab Via Navigation Bar
	Open Cards Tab
	Verify Cards Tab Open
	Check The Presence Of Cards

