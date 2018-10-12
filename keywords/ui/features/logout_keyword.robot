*** Settings ***
Resource          profile_keyword.robot
*** Keywords ***
Logout from current user
    [Documentation]    Click 'logout' button from main page
    Click user profile nav
    Wait Until Element Is Visible    ${logout_btn}
    Click element    ${logout_btn}