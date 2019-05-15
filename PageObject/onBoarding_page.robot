*** Settings ***
Library             AppiumLibrary

*** Variables ***
${SKIP}                 //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeButton[1]
${NEXT}                 //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeButton[2]
${LOGIN_REGISTER}     Login/Registrasi
${LOGIN}         Login
${REGISTER}      Registrasi

*** Keywords ***
Click Skip
    Click Element       ${SKIP}

Click Next
    Click Element       ${NEXT}

Click Login/Register
    Click Element       ${LOGIN_REGISTER}

Click Login
    Click Element       ${LOGIN}

Click Register
    Click Element       ${REGISTER}
