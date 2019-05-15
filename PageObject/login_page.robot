*** Settings ***
Library             AppiumLibrary


*** Variables ***
${INPUT_EMAIL}                      //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeTextField[@value="Masukkan email"]
${INPUT_EMAIL2}                     //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[1]/XCUIElementTypeTextField
${INPUT_PASSWORD}                   //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeSecureTextField[@value="Masukkan password"]
${INPUT_PASSWORD2}                  //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeSecureTextField

${FORGOT_PASSWORD}                  //XCUIElementTypeStaticText[@name="Lupa Password?"]
${BUTTON_LOGIN}                     //XCUIElementTypeButton[@name="Login"]
${LOGIN_FACEBOOK}                   Facebook
${LOGIN_GOOGLE}                     Google
${REGISTRASI}                       Belum punya akun Bhinneka? Registrasi.
${MY_ACCOUNT}                       Akun Saya
${BUTTON_LOGOUT}                    Logout
${POP_UP_ERROR}                     //XCUIElementTypeStaticText[@name="Error"]
${BUTTON_CLOSE}                     //XCUIElementTypeAlert[@name="Error"]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[3]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther
${YES}                              Ya


*** Keywords ***
Input Email ${email}
    Tap                             ${INPUT_EMAIL}
    Input Text                      ${INPUT_EMAIL}              ${email}

Invalid Input Email ${email2}
    Clear Text                      ${INPUT_EMAIL2}
    Tap                             ${INPUT_EMAIL2}
    Input Text                      ${INPUT_EMAIL2}              ${email2}

Input Password ${pass}
    Tap                             ${INPUT_PASSWORD}
    Input Text                      ${INPUT_PASSWORD}           ${pass}

Invalid Input Password ${pass2}
    Clear Text                      ${INPUT_PASSWORD2}
    Tap                             ${INPUT_PASSWORD2}
    Input Text                      ${INPUT_PASSWORD2}           ${pass2}

Click Button Login
    Click Element                   ${BUTTON_LOGIN}

Login Page Has Been Opened
    Page Should Contain Element     ${INPUT_EMAIL}
    Page Should Contain Element     ${INPUT_PASSWORD}
    Page Should Contain Element     ${BUTTON_LOGIN}
    Page Should Contain Element     ${LOGIN_FACEBOOK}
    Page Should Contain Element     ${LOGIN_GOOGLE}

Login Page Has Been Opened 2
    Page Should Contain Element     ${INPUT_EMAIL2}
    Page Should Contain Element     ${INPUT_PASSWORD2}
    Page Should Contain Element     ${BUTTON_LOGIN}
    Page Should Contain Element     ${LOGIN_FACEBOOK}
    Page Should Contain Element     ${LOGIN_GOOGLE}

User Successfully Login And Logout
    Wait Until Page Contains        ${MY_ACCOUNT}
    Click Element                   ${MY_ACCOUNT}
    Page Should Contain Element     ${BUTTON_LOGOUT}
    Click Element                   ${BUTTON_LOGOUT}
    Click Element                   ${YES}
    Wait Until Page Contains         ${MY_ACCOUNT}

Error Invalid Account
    Wait Until Element Is Visible   ${POP_UP_ERROR}
    Click Element                   ${BUTTON_CLOSE}


