*** Keywords ***
Validate user profile after login
    [Documentation]    Validate if username after login
    [Arguments]    ${displayname}
    Wait Until Keyword Succeeds    3x    1s    Wait Until Element Is Visible    ${profile_nav}
    Element Should Contain    ${profile_nav}    ${displayname}      ignore_case=True

Click user profile nav
    [Documentation]    Click user profile nav to activate dropdown
    Wait Until Keyword Succeeds    3x    1s   Wait Until Element Is Visible    ${profile_nav}
    Mouse Over    ${profile_nav}