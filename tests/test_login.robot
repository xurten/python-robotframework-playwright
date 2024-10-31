*** Settings ***
Library   Browser
Resource    ../pages/LoginPage.robot

*** Variables ***
${USERNAME}    KB
${PASSWORD}    KB
${DEMOBLAZE_URL}    https://www.demoblaze.com

*** Test Cases ***
Test User Login
    LoginPage.Login Into System