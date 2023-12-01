*** Settings ***
Resource            ../resources.robot
Resource            ../pages/common.robot
Resource            ../pages/sign_in_page.robot
Resource            ../pages/dashboard_page.robot

Test Setup          Open Login Page Using Chrome Browser
Test Teardown       Close Browser


*** Variables ***
${valid_email}          jforjantung@gmail.com
${valid_password}       kosakionodera


*** Test Cases ***
Valid Sign In
    [Documentation]    Test a valid sign-in process
    Sign In Page Opened
    Sign In With Credentials    ${valid_email}    ${valid_password}

    Wait Until Element Is Visible    ${ALERT_TITLE}

    ${actual_title} =    Get Text    ${ALERT_TITLE}
    ${actual_content} =    Get Text    ${ALERT_CONTENT}

    Should Be Equal As Strings    ${actual_title}    ${EXPECTED_ALERT_TITLE}
    Should Be Equal As Strings    ${actual_content}    ${EXPECTED_ALERT_CONTENT}

    Click Button Confirm Alert
    Wait Until Element Is Visible    ${BUTTON_LOGOUT}
