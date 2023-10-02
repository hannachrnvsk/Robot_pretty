*** Settings ***
Resource    Resources/Page_Objects/User_account_API.robot
Resource  Resources/Page_Objects/Base/Test_data_Valid.robot

*** Test Cases ***
Loging Into Account
	Authorize User    ${USER_ACC_API}


