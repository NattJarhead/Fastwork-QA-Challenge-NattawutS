*** Settings ***
Resource    ../../resources/imports.robot

*** Keywords ***
Open fastwork main page with
    [Documentation]    Open browser with browser type
    [Arguments]    ${browser}
    Open Browser    ${fastwork_url}    ${browser}
    Cancel notification popup

Open fastwork search page with
    [Documentation]    Open browser with browser type
    [Arguments]    ${browser}
    ${search_url}=    Catenate    SEPARATOR=    ${fastwork_url}    ${search_uri}
    Open Browser    ${search_url}    ${browser}


Open fastwork search using sociamedia banner with
    [Documentation]    Open browser with browser type
    [Arguments]    ${browser}
    ${search_url}=    Catenate    SEPARATOR=    ${fastwork_url}    ${social_media_banner_uri}
    Open Browser    ${search_url}    ${browser}


Cancel notification popup
    [Documentation]    click cancel notification
    Wait Until Element Is Visible    ${noti_popup}    10s
    Wait Until Element Is Visible    ${cancel_noti_btn}
    Click element    ${cancel_noti_btn}

#Clear current auth state
#    [Documentation]    If no profile is visible then reload Else if no login found that logout
#    ${is_login}=  Run Keyword And Expect Error    Element Should Be Visible    profile_nav
#    Run Keyword If          ${is_login}    Logout from current user
#    Run Keyword Unless      ${is_login}    Reload Page
#
#Verify current loging state
#    [Documentation]    Validate the login status
#