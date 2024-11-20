*** Settings ***
Library    AppiumLibrary

*** Variables ***
${APPIUM_SERVER}      http://localhost:4723/wd/hub
${PLATFORM}           Android
${DEVICE_NAME}        emulator-5554
${PLATFORM_VERSION}   15.0   # Adjust this based on your simulator's iOS version
${APP_PATH}           /Users/basdos/Downloads/demo.apk  # Replace with the path to your .app file

*** Test Cases ***
Test Android App On Simulator
    [Documentation]    Test Android app
    Given open demo application
    When input email and password
    And click login button
    Then verify message success alert
    
*** Keywords ***
Given open demo application
    Open Application    ${APPIUM_SERVER}    platformName=${PLATFORM}    deviceName=${DEVICE_NAME}    platformVersion=${PLATFORM_VERSION}    app=${APP_PATH} 
    Wait Until Element Is Visible    accessibility_id=Home-screen

When input email and password
    Click Element    accessibility_id=Login
    Wait Until Element Is Visible    accessibility_id=button-login-container
    Input Text    accessibility_id=input-email    test@gmail.com
    Input Text    accessibility_id=input-password    test1234

And click login button
    Click Element    accessibility_id=button-LOGIN

Then verify message success alert
    Wait Until Element Is Visible    id=android:id/alertTitle
    Element Text Should Be    id=android:id/alertTitle    Success
    Element Text Should Be    id=android:id/message    You are logged in!
    Capture Page Screenshot
    Click Element    id=android:id/button1
    Close Application