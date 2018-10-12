*** Keywords ***
Login with facebook web username and password
    [Documentation]    login with facebook web
    [Arguments]    ${username}     ${password}
    Go To       ${facebook_url}
    Delete All Cookies
    Reload Page
    Input Text    ${facebook_web_username_txt}     ${username}
    Input Text    ${facebook_web_password_txt}     ${password}
    Click element    ${facebook_web_login_btn}

Login with facebook oauth username and password
    [Documentation]    Login with facebook account
    [Arguments]    ${username}    ${password}
    Input Text    ${facebook_auth_username_txt}     ${username}
    Input Text    ${facebook_auth_password_txt}     ${password}
    Click element    ${facebook_auth_login_btn}

Login with google oauth username and password
    [Documentation]    Login with Google account
    [Arguments]    ${username}    ${password}
    Input Text    ${google_auth_mail_txt}     ${username}
    Click element    ${next_btn_mailtopwd}
    Wait Until Element Is Visible    ${google_auth_pass_txt}
    Input Text    ${google_auth_pass_txt}     ${password}
    Click element    ${next_btn_signin}