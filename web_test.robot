
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${BASE_URL}   https://www.saucedemo.com
${USERNAME}   id=user-name
${PASSWORD}   id=password
${LOGIN}    id=login-button
${TIMEOUT}    10

*** Test Cases ***

Open Browser and login saucedemo
    [Documentation]    Test to open chrome and login saucedemo
    Given the browser is open
    When I go to the login page
    And I input valid credentials
    Then I should be logged in successfully

*** Keywords ***
Given the browser is open
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

When I go to the login page
    Wait Until Element Is Visible    ${USERNAME}    ${TIMEOUT}

And I input valid credentials
    Input Text    ${USERNAME}    standard_user
    Input Text    ${PASSWORD}    secret_sauce
    Press Keys     ${LOGIN}    ${TIMEOUT}

Then I should be logged in successfully
    Wait Until Element Contains    class=app_logo    Swag Labs
    Capture Page Screenshot
    Close Browser