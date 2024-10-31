*** Settings ***
Library   Browser
Resource    ../pages/LoginPage.robot


*** Variables ***
${USERNAME}    KB
${PASSWORD}    KB
${DEMOBLAZE_URL}    https://www.demoblaze.com


*** Test Cases ***
Test Add Monitor
    LoginPage.Login Into System
    Click    text=Monitors
    Click    text=Apple monitor 24
    Wait For Condition    Text    h2   contains    Apple monitor 24
    Take Screenshot    screenshoot_after_condition_for_monitors
    Click    text=Add to cart
    Wait For Alert    action=accept
    Click    id=cartur
    Wait For Elements State   id=totalp    visible
    Take Screenshot    screenshoot_at_the_end