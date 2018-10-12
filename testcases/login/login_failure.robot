*** Settings ***
Resource          ../../resources/imports.robot
Resource          ../../keywords/ui/features/login_keyword.robot
Resource          ../../keywords/ui/features/profile_keyword.robot
Resource          ../../keywords/ui/features/logout_keyword.robot
Suite setup       Open fastwork main page with    chrome
Suite teardown    close browser
Test teardown     Close login modal

*** Test Cases ***
login_013 failure - login with empty username
    [tags]    regression    medium
    Click login button on main page
    Login with username and password    ${empty_str}    ${s_random_fail_str}
    sleep    2s
    Verify error message on empty username

login_014 failure - login with empty password
    [tags]    regression    medium
    Click login button on main page
    Login with username and password    ${s_random_fail_str}    ${empty_str}
    sleep    2s
    Verify error message on empty password

login_015 failure - login with both empty username&password
    [tags]    regression    medium
    Click login button on main page
    Login with username and password    ${empty_str}    ${empty_str}
    sleep    2s
    Verify error message on empty username
    Verify error message on empty password

login_016 failure - login with invalid credential
    [tags]    regression    high
    Click login button on main page
    Login with username and password    ${s_random_fail_str}    ${s_login_wuser_pwd}
    sleep    2s
    Verify error message on invalid credential