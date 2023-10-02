*** Settings ***
Documentation    Cards overview in user account
Resource  Resources/User_actions_UI.robot
Resource  Resources/Page_Objects/Base/Common_steps_UI.robot
Resource  Resources/Page_Objects/Base/Test_data_Valid.robot
Test Setup  Log In User  @{USER_2_HAS_ADDED_CARDS}
Test Teardown  Common_steps.End Browser Session


*** Test Cases ***
Cards are available in user account
	[Documentation]    C6500231 - https://vmmreg32.testrail.net/index.php?/cases/view/6500231
	[Tags]    UI
	Open Cards Tab Via Navigation Bar

Cards info is visible and complete
	[Documentation]    C6500238 - https://vmmreg32.testrail.net/index.php?/cases/view/6500238
	[Tags]    UI
	Open Cards Tab Via Navigation Bar









