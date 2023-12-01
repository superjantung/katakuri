*** Settings ***
Resource            ../resources.robot
Resource            ../pages/common.robot
Resource            ../pages/sign_up_page.robot
Library             String

Test Setup          Open Main Page Using Chrome Browser
Test Teardown       Close Browser


*** Variables ***
${VALID_PASSWORD}       Password,1,2,3!


*** Test Cases ***
Dynamic User Registration
    [Documentation]    Test dynamic registration
    ${RANDOM_USERNAME} =    Generate Random String    10    [NUMBERS]

    Home Page Opened
    Fill Registration Form
    ...    John
    ...    Doe
    ...    ${RANDOM_USERNAME}@example.com
    ...    1234567890
    ...    Jalan 123
    ...    ${VALID_PASSWORD}
    ...    ${VALID_PASSWORD}
    Click Register Button

    Element Should Be Visible    ${ALERT_TITLE}
    Element Should Be Visible    ${ALERT_CONTENT}

    ${actual_title} =    Get Text    ${ALERT_TITLE}
    ${actual_content} =    Get Text    ${ALERT_CONTENT}

    Should Be Equal As Strings    ${actual_title}    ${EXPECTED_ALERT_TITLE}
    Should Be Equal As Strings    ${actual_content}    ${EXPECTED_ALERT_CONTENT}

User Registration Missing Fields
    Home Page Opened
    Click Register Button

    ${EXPECTED_ERRORS} =    Create List
    ...    Please enter a firstname
    ...    Please enter a lastname
    ...    Please provide an email
    ...    Please enter a password
    ...    Please enter a password

    FOR    ${FIELD_ERROR}    IN    ${FIRST_NAME_ERROR}    ${LAST_NAME_ERROR}    ${EMAIL_ERROR}    ${PASSWORD_ERROR}    ${CONFIRM_PASSWORD_ERROR}
        Element Should Be Visible    ${FIELD_ERROR}
        ${ERROR_TEXT} =    Get Text    ${FIELD_ERROR}
        ${INDEX} =    Evaluate    str(${EXPECTED_ERRORS.index("${ERROR_TEXT}")})
        Should Contain    ${ERROR_TEXT}    ${EXPECTED_ERRORS[${INDEX}]}
    END

Invalid Email Format
    Home Page Opened
    Fill Registration Form
    ...    John
    ...    Doe
    ...    invalid_email
    ...    1234567890
    ...    Jalan 123
    ...    ${VALID_PASSWORD}
    ...    ${VALID_PASSWORD}
    Click Register Button
    Element Should Be Visible    ${EMAIL_ERROR}
    ${ERROR_TEXT} =    Get Text    ${EMAIL_ERROR}
    Should Contain    ${ERROR_TEXT}    Please enter a valid email address.

Weak Password
    Home Page Opened
    Fill Registration Form
    ...    John
    ...    Doe
    ...    user@example.com
    ...    123
    ...    Jalan 123
    ...    123
    ...    123
    Click Register Button
    Element Should Be Visible    ${PASSWORD_ERROR}
    ${ERROR_TEXT} =    Get Text    ${PASSWORD_ERROR}
    Should Contain    ${ERROR_TEXT}    Please enter at least 6 characters.

Password Mismatch
    Home Page Opened
    Fill Registration Form
    ...    John
    ...    Doe
    ...    user@example.com
    ...    1234567890
    ...    Jalan 123
    ...    ${VALID_PASSWORD}
    ...    invalid_password
    Click Register Button
    Element Should Be Visible    ${CONFIRM_PASSWORD_ERROR}
    ${ERROR_TEXT} =    Get Text    ${CONFIRM_PASSWORD_ERROR}
    Should Contain    ${ERROR_TEXT}    Password need to match
