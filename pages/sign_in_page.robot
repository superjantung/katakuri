*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${INPUT_EMAIL}                  id:your_email
${INPUT_PASSWORD}               id:password
${BUTTON_LOGIN}                 css:input[value='Login']

${ALERT_TITLE}                  id:swal2-title
${ALERT_CONTENT}                id:swal2-content

${EXPECTED_ALERT_TITLE}         Success
${EXPECTED_ALERT_CONTENT}       Welcome Back, Mr Blizzard!


*** Keywords ***
Sign In Page Opened
    Wait Until Element Is Visible    ${INPUT_EMAIL}
    Wait Until Element Is Visible    ${INPUT_PASSWORD}
    Wait Until Element Is Visible    ${BUTTON_LOGIN}

Sign In With Credentials
    [Arguments]    ${email}    ${password}
    Input Text    ${INPUT_EMAIL}    ${email}
    Input Password    ${INPUT_PASSWORD}    ${password}
    Click Element    ${BUTTON_LOGIN}

Click Login Button
    Click Element    ${BUTTON_LOGIN}
