*** Settings ***
Resource          ../../resources/imports.robot
Resource          ../../keywords/ui/features/login_keyword.robot
Resource          ../../keywords/ui/features/logout_keyword.robot
Resource          ../../keywords/ui/features/profile_keyword.robot
Resource          ../../keywords/ui/pages/3rd_party_pages.robot
Suite setup       Open fastwork main page with   chrome
Suite teardown    close browser
Test teardown     Run Keyword And Ignore Error    Logout from current user
#Test teardown     Clear current auth state

*** Test Cases ***
login_001 success - login with email
    [tags]    regression    high
    Click login button on main page
    Login with username and password    ${1_login_email_usr}    ${1_login_wuser_pwd}
    Validate user profile after login    ${1_login_wuser_display}

login_002 success - login with mobile
    [tags]    regression    high
    Click login button on main page
    Login with username and password    ${1_login_mobile_usr}    ${1_login_wuser_pwd}
    Validate user profile after login    ${1_login_wuser_display}

login_003 success - login with fb never sign in
    [tags]    regression    high
    Click login button on main page
    Click to login with facebook oauth
    sleep   2s      #Wait page load
    Select Window   title:${fb_oauth_title}
    Login with facebook oauth username and password    ${facebook_username}    ${facebook_pwd}
    Select Window   title:${default_title}
    Validate user profile after login    ${facebook_user_display}

login_004 success - login with fb signed in
    [Documentation]     Optimize step by running after login_003
    [tags]    regression    high
    #Login with facebook web username and password         ${facebook_username}    ${facebook_pwd}
    #Go To       ${fastwork_url}
    Click login button on main page
    Click to login with facebook oauth
    sleep   2s      #Wait page load
    Validate user profile after login    ${facebook_user_display}

login_005 success - login with google never sign in
    [tags]    regression    high
    Click login button on main page
    Click to login with google oauth
    sleep   2s      #Wait page load
    Select Window   title:${google_oauth_title}
    Login with google oauth username and password       ${google_username}    ${google_pwd}
    Select Window   title:${default_title}
    Close login modal   #goole doesn't redict like facebook
    Validate user profile after login    ${google_user_display}

login_006 success - login with google signed in
    [Documentation]     Optimize step by running after login_005
    [tags]    regression    high
    Click login button on main page
    Click to login with google oauth
    sleep   2s      #Wait page load
    Validate user profile after login    ${google_user_display}

login_007 success - refresh page after login
    [tags]    regression    high
    Click login button on main page
    Login with username and password    ${1_login_email_usr}    ${1_login_wuser_pwd}
    Validate user profile after login    ${1_login_wuser_display}
    Reload Page
    Validate user profile after login    ${1_login_wuser_display}

login_008 success - login and logout identity check
    [tags]    regression    high
    Click login button on main page
    Login with username and password    ${1_login_email_usr}    ${1_login_wuser_pwd}
    Validate user profile after login    ${1_login_wuser_display}
    Logout from current user
    Click login button on main page
    Login with username and password    ${2_login_email_usr}    ${2_login_wuser_pwd}
    Validate user profile after login    ${2_login_wuser_display}

login_009 success - close login modal
    [tags]    regression    medium
    Reload Page
    Click login button on main page
    Close login modal

#login_010 success - login compatability with ie
#   Manual Test
#login_011 success - login compatability with firefox
#   Manual Test
#login_012 success - login compatability with safari
#   Manual Test