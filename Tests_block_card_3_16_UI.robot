*** Settings ***
Documentation    Blocking a card
Resource  Resources/User_actions_UI.robot
Resource  Resources/Page_Objects/Base/Common_steps_UI.robot
Resource  Resources/Page_Objects/Cards_page_UI.robot
Resource  Resources/Page_Objects/Base/Test_data_Valid.robot
Test Setup    Log In User  @{USER_3_BLOCK_CARD}
Test Teardown  Common_steps.End Browser Session


*** Test Cases ***
The modal window for a card block action contains all elements
	[Documentation]    C6482087 - https://vmmreg32.testrail.net/index.php?/cases/view/6482087
	[Tags]    UI
	Open Cards Tab Via Navigation Bar
	Open Card Info Window
	Press Block Card Button
	Verify Presence Of Needed Elements In Blocking Card Form

The reasons for blocking card meet the requirements
	[Documentation]    C6482150- https://vmmreg32.testrail.net/index.php?/cases/view/6482150
	[Tags]    UI
	Open Cards Tab Via Navigation Bar
	Open Card Info Window
	Press Block Card Button
	Check The Reasons For Blocking Card Form

Only one reason for blocking card can be chosen
	[Documentation]    C6482363- https://vmmreg32.testrail.net/index.php?/cases/view/6482363
	[Tags]    UI
	Open Cards Tab Via Navigation Bar
	Open Card Info Window
	Press Block Card Button
	Check Work Of Radio Buttons Of Reasons

Canceling of a card block action
	[Documentation]    C6482431- https://vmmreg32.testrail.net/index.php?/cases/view/6482431
	[Tags]    UI
	Open Cards Tab Via Navigation Bar
	Open Card Info Window
	Press Block Card Button
	Choose A Reason For Blocking a Card  0



