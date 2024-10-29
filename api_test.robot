
*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${baseUrl}    https://dummyjson.com


*** Test Cases ***

Test API Request Login
    [Documentation]    hit login endpoint
    Given user hit api request login
    When verify status code
    Then verify response body

*** Keywords ***
Given user hit api request login
    Create Session    sessionLogin    ${baseUrl}    headers={"Content-Type": "application/json"}
    ${requestBody}=    Create Dictionary    username=emilys    password=emilyspass
    ${response}=    Post Request    sessionLogin    /auth/login    json=${requestBody}
    Set Suite Variable    ${responseCode}      ${response.status_code}
    Set Suite Variable    ${responseContent}    ${response.content}
   
    

When verify status code
    Log To Console  TEST Status Code : ${responseCode}
    Should Be Equal As Numbers    ${responseCode}    200
    

Then verify response body
    ${response_body}=  To Json  ${responseContent}
    Should Be Equal      ${response_body['gender']}    female
    Should Be Equal      ${response_body['firstName']}    Emily
    Log To Console    Value accessToken :${response_body['accessToken']}