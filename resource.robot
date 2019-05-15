*** Settings ***
Library         AppiumLibrary
Resource        PageObject/onBoarding_page.robot
Resource        PageObject/login_page.robot

*** Variables ***
${REMOTE_URL}               http://127.0.0.1:4723/wd/hub      # URL to appium server
${PLATFORM_NAME}            iOS
${PLATFORM_VERSION}         12.1
${DEVICE_NAME}              iPhone 7
#Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}             #location .app
${BUNDLE_ID}                #bundle ID

${APPIUM_SERVER1}           http://127.0.0.1:4723/wd/hub
${app}                      #bundle ID       #find package name of your app
${version}                  12.2
${platform}                 iOS
${deviceName}               iPhone 7
${udid}                     #udid real device iphone
${platformName}             iOS
${name}                     My First Mobile Test
${automationName}           XCUITest
${xcodeOrgId}               #org id
${xcodeSigningId}           #org sign in
${usePrebuiltWDA}           true

${BACKGROUND}               //XCUIElementTypeApplication[@name="Bhinneka - Beta"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther[2]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeScrollView


*** Keywords ***
Open App
     Open Application    ${REMOTE_URL}    alias=Myapp1  platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}      bundleId=${BUNDLE_ID}      automationName=appium

Install And Open App
     Open Application    ${REMOTE_URL}    alias=Myapp1  platformName=${PLATFORM_NAME}    platformVersion=${PLATFORM_VERSION}    deviceName=${DEVICE_NAME}      bundleId=${BUNDLE_ID}    app=${APP_LOCATION}       automationName=appium

Open Apps In Real Device
        Open Application    ${APPIUM_SERVER1}    app=${app}    version=${version}    platform=${platform}    deviceName=${deviceName}    udid=${udid}    platformName=${platformName}    newCommandTimeout=2500
        ...    name=${name}    automationName=${automationName}    xcodeOrgId=${xcodeOrgId}    xcodeSigningId=${xcodeSigningId}    usePrebuiltWDA=${usePrebuiltWDA}

Close All Apps
     Close All Applications

Swipe Left
    Swipe By Direction          left

Swipe Right
    Swipe By Direction          right

Swipe Down
    Swipe By Direction          down

Swipe Up
    ${element_size}             Get Element Size                ${BACKGROUND}
    ${element_location}         Get Element Location            ${BACKGROUND}
    ${start_x}                  Evaluate                        ${element_location['x']} + (${element_size['width']} * 0.5)
    ${start_y}                  Evaluate                        ${element_location['y']} + (${element_size['height']} * 0.5)
    ${end_x}                    Evaluate                        ${element_location['x']} + (${element_size['width']} * 0.5)
    ${end_y}                    Evaluate                        ${element_location['y']} + (${element_size['height']} * 0.3)
    Swipe                       ${start_x}    ${start_y}  ${end_x}  ${end_y}  500

User Open Login Page From OnBoarding Page
    Install And Open App
    Swipe Left
    Click Next
    Click Login/Register
    Click Login

User Open Login Page From Tab Menu
    Open App
    Click Element               ${MY_ACCOUNT}
    Click Login
