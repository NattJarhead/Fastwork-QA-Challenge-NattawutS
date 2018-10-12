*** Keywords ***
Click login button on main page
    [Documentation]    Click 'login' button from main page
    Wait Until Element Is Visible    ${login_page_btn}
    Wait Until Keyword Succeeds    3x    1s   Click element    ${login_page_btn}

Click to login with facebook oauth
    [Documentation]    Click login with facebook butthon
    Click element    ${login_w_fb}

Click to login with google oauth
    [Documentation]    Click login with facebook butthon
    Click element    ${login_w_g}

Login with username and password
    [Documentation]    Type username and password with argument provide
    [Arguments]    ${username}    ${password}
    Input Text    ${login_username_txt}     ${username}
    Input Text    ${login_password_txt}     ${password}
    Click element    ${login_modal_btn}

Clear username and password box
    [Documentation]    Clear Text for loign
    Clear Element Text    ${login_username_txt}
    Clear Element Text    ${login_password_txt}

Verify error message on empty username
    [Documentation]    Verify error message popup on username
    Element Should Contain    ${username_err_msg}    ${err_msg_empty}      ignore_case=True

Verify error message on empty password
    [Documentation]    Verify error message popup on password
    Element Should Contain    ${password_err_msg}    ${err_msg_empty}      ignore_case=True

Verify error message on invalid credential
    [Documentation]    Verify that invalid login message is shown
    Element Should Contain    ${invalid_err_msg}    ${err_msg_invalid_login}      ignore_case=True

Close login modal
    [Documentation]    Close login modal
    Click element   ${login_modal_close_btn}
