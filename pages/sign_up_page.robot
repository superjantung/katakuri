*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${INPUT_FIRST_NAME}                 id:firstName
${FIRST_NAME_ERROR}                 id:firstName-error

${INPUT_LAST_NAME}                  id:lastName
${LAST_NAME_ERROR}                  id:lastName-error

${INPUT_EMAIL}                      id:email
${EMAIL_ERROR}                      id:email-error

${INPUT_PHONE_NUMBER}               id:phoneNumber
${INPUT_ADDRESS}                    id:address
${INPUT_PASSWORD}                   id:password
${PASSWORD_ERROR}                   id:password-error

${INPUT_PASSWORD_CONFIRMATION}      id:confirm_password
${CONFIRM_PASSWORD_ERROR}           id:confirm_password-error

${BUTTON_REGISTER}                  css:input[value='Register']

${EXPECTED_ALERT_TITLE}             Success
${EXPECTED_ALERT_CONTENT}           Check your email to confirm your registration


*** Keywords ***
Home Page Opened
    Wait Until Element Is Visible    ${INPUT_FIRST_NAME}

Fill Registration Form
    [Arguments]
    ...    ${first_name}
    ...    ${last_name}
    ...    ${email}
    ...    ${phone_number}
    ...    ${address}
    ...    ${password}
    ...    ${password_confirmation}
    Input Text    ${INPUT_FIRST_NAME}    ${first_name}
    Input Text    ${INPUT_LAST_NAME}    ${last_name}
    Input Text    ${INPUT_EMAIL}    ${email}
    Input Text    ${INPUT_PHONE_NUMBER}    ${phone_number}
    Input Text    ${INPUT_ADDRESS}    ${address}
    Input Text    ${INPUT_PASSWORD}    ${password}
    Input Text    ${INPUT_PASSWORD_CONFIRMATION}    ${password_confirmation}

Click Register Button
    Click Element    ${BUTTON_REGISTER}
