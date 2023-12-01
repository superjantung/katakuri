*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${SUCCESS_RING}     css:.swal2-success-ring
${ERROR_RING}       css:.swal2-x-mark
${ALERT_TITLE}      id:swal2-title
${ALERT_CONTENT}    id:swal2-content
${ALERT_CONFIRM}    css:button[class='swal2-confirm swal2-styled']


*** Keywords ***
Click Button Confirm Alert
    Click Element    ${ALERT_CONFIRM}
