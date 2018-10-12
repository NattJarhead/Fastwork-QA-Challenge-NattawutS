*** Settings ***
Resource          ../../resources/imports.robot
Resource          ../../keywords/ui/features/search_keyword.robot
Suite setup       Open fastwork search using sociamedia banner with   chrome
Suite teardown    close browser
Test setup        Run Keyword And Ignore Error     Cancel notification popup
Test teardown     Clear search text box

*** Test Cases ***
search_009 success - search with keyword and catagory filter
    [tags]    regression    high
    Search on text box with words    ${smb_target_search}
    Validate search with filter