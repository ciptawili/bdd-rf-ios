*** Settings ***
Resource                ../resource.robot
Resource                ../PageObject/login_page.robot
Test Setup              User Open Login Page From OnBoarding Page

*** Test Cases ***
User Can Login With Valid Account
    [Tags]  positive
    Given Login Page Has Been Opened
    When User Login With Email bhintesting6@gmail.com And Password Coba@123
    Then User Successfully Login And Logout
    [Teardown]  Close Application

User Login With Invalid Account
    [Tags]  negative
    [Setup]  User Open Login Page From Tab Menu
    [Template]  Invalid Account
    [Teardown]  Close Application
    #email                      password
    test@gmail.com              1234456
    bhintesting5@gmail.com      test123

*** Keywords ***
Invalid Account
    [Arguments]  ${email}   ${pass}
    Given Login Page Has Been Opened 2
    When Login With Email 2 ${email} And Password 2 ${pass}
    Then Error Invalid Account

User Login With Email ${email} And Password ${pass}
    Input Email ${email}
    Input Password ${pass}
    Click Button Login

Login With Email 2 ${email2} And Password 2 ${pass2}
    Invalid Input Email ${email2}
    Invalid Input Password ${pass2}
    Click Button Login


