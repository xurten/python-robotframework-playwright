*** Variables ***
${DEFAULT_USERNAME}    KB
${DEFAULT_PASSWORD}    KB
${DEMOBLAZE_URL}    https://www.demoblaze.com


*** Settings ***
Library   Browser

*** Keywords ***
Fill User Name
    [Documentation]    This keyword fills in the username field on the login form. It accepts a username as an argument and defaults to the predefined username if none is provided.
    [Arguments]    ${username}=${DEFAULT_USERNAME}
    Fill Text    id=loginusername    ${username}

Fill Password
    [Documentation]    This keyword fills in the password field on the login form. It accepts a password as an argument and defaults to the predefined password if none is provided.
    [Arguments]    ${password}=${DEFAULT_PASSWORD}
    Fill Text    id=loginpassword    ${password}

Click Login In Button From Menu
    [Documentation]    This keyword clicks the "Login" button in the menu to open the login form.
    Click    id=login2

Click Login Button
    [Documentation]    This keyword clicks the "Log in" button on the login form.
    Click    xpath=//button[text()='Log in']

Login Into System
    [Documentation]    This keyword automates the login process for the Demoblaze website. It opens the browser, navigates to the site, and performs the login steps.
    New Browser    chromium    headless=true
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${DEMOBLAZE_URL}
    Click Login In Button From Menu
    Fill User Name
    Fill Password
    Click Login Button
    Wait For Condition    Text    id=nameofuser    contains    Welcome ${DEFAULT_USERNAME}
    Log    message