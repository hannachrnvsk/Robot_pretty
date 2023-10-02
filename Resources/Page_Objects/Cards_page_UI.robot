*** Settings ***
Library  SeleniumLibrary
Library    Collections

*** Variables ***
${HEADER_TITLE} =  //h1[text()='My cards']
${CARD_IMAGE_A} =  //*[@id="root"]/main/div[2]/div/div/div[1]
${CARD_IMAGE_B} =  //*[@id="root"]/main/div[2]/div/div/div[2]
${BLOCK_CARD_BUTTON_LOC} =  //button[text()='Block card']
${BLOCKING_CARD_FORM_LOC} =  //div[@class='modal-root']/div[@class='sc-bgqQcB gPBYZA']/div[2]/form/div
${RADIOBUTTONS_BLOCK_LOC} =  //div[@class='modal-root']/div[@class='sc-bgqQcB gPBYZA']/div[2]/form/div/div[2]/div[1]
@{REASONS_FOR_BOCKING_CARD} =  Card was stolen  Card was lost  Suspicious transactions  I no longer need to use this card  Other
${WARNING_MESSAGE_LOC} =  //div[@class='modal-root']/div[@class='sc-bgqQcB gPBYZA']/div[2]/form/div/div[2]/div[2]
${SUBMIT_BLOCKING_LOC} =  //div[@class='modal-root']/div[@class='sc-bgqQcB gPBYZA']/div[2]/form/div/div[3]/div/button[@type='submit']
${CANCEL_BLOCKING_LOC} =  //div[@class='modal-root']/div[@class='sc-bgqQcB gPBYZA']/div[2]/form/div/div[3]/div/button[@type='button']
${RADIOBUTTONS_LOC} =  //div[@class='modal-root']/div[@class='sc-bgqQcB gPBYZA']/div[2]/form/div/div[2]/div/div


*** Keywords ***
Verify Cards Tab Open
	Element Should Be Visible  ${HEADER_TITLE}

Check The Presence Of Cards
	Element Should Be Visible  ${CARD_IMAGE_A}

Open Card Info Window
	Double Click Element    ${CARD_IMAGE_A}

Press Block Card Button
	${bloc_card_button_el}=  Get Webelement    ${BLOCK_CARD_BUTTON_LOC}
	Element Should Be Visible    ${bloc_card_button_el}
	Click Element    ${bloc_card_button_el}
	Wait Until Element Is Visible    ${BLOCKING_CARD_FORM_LOC}

Verify Presence Of Needed Elements In Blocking Card Form
	${radiobutton_block_el}=  Get Webelement    ${RADIOBUTTONS_BLOCK_LOC}
	Element Should Be Visible    ${radiobutton_block_el}
	${warning_message_el}=  Get Webelement    ${WARNING_MESSAGE_LOC}
	Element Should Be Visible    ${warning_message_el}
	Element Should Contain    ${warning_message_el}  You won’t be able to use the card after it has been blocked. You can only reissue another one.
	Element Should Be Visible    ${CANCEL_BLOCKING_LOC}
	Element Should Be Visible    ${SUBMIT_BLOCKING_LOC}

Check The Reasons For Blocking Card Form
	${radiobutton_block_el}=  Get Webelement    ${RADIOBUTTONS_BLOCK_LOC}
	Element Should Be Visible    ${radiobutton_block_el}
	Radio Button Should Not Be Selected    reason
	FOR  ${reason}  IN  @{REASONS_FOR_BOCKING_CARD}
		Element Should Contain    ${radiobutton_block_el}  ${reason}
	END

Check Work Of Radio Buttons Of Reasons
	@{radiobuttons_reasons_els}=  Get Webelements    ${RADIOBUTTONS_LOC}
	FOR  ${radiobutton_reason}  IN  @{radiobuttons_reasons_els}
		${current_index}=  Get Index From List  ${radiobuttons_reasons_els}    ${radiobutton_reason}
		Click Element    ${radiobutton_reason}
		Sleep    2s
		Radio Button Should Be Set To   reason   ${REASONS_FOR_BOCKING_CARD}[${current_index}]
	END


Choose A Reason For Blocking a Card
	[Arguments]    ${reason_index}
	@{radiobuttons_reasons_els}=  Get Webelements    ${RADIOBUTTONS_LOC}
	Click Element    ${radiobuttons_reasons_els}[${reason_index}]
	Radio Button Should Be Set To   reason   ${REASONS_FOR_BOCKING_CARD}[${reason_index}]


