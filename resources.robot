*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${MAIN_PAGE}        https://qademo.onebrick.io/
${LOGIN_PAGE}       ${MAIN_PAGE}/login


*** Keywords ***
Open Main Page Using Chrome Browser
    Open Browser    ${MAIN_PAGE}    Chrome
    Maximize Browser Window

Open Login Page Using Chrome Browser
    Open Browser    ${LOGIN_PAGE}    Chrome
    Maximize Browser Window
