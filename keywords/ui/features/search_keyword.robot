
*** Keywords ***
Search on text box with words
    [Documentation]    Search with provided words
    [Arguments]     ${search_word}
    Input Text      ${search_txt_box}    ${search_word}
    Press Key    ${search_txt_box}    \\13
    Wait Until Element Is Not Visible    ${search_loader_active}

Clear search text box
    [Documentation]    Clear Text for search
    Clear Element Text    ${search_txt_box}

Validate search content box
    [Documentation]    Validate search result
    [Arguments]     ${search_word}    ${expect_count}
    ${result}=    Catenate    ${search_result_pattern}    ${search_word}   ${expect_count}
    Element Should Contain    ${search_result_txt}    ${result}

Validate search with filter
    [Documentation]    Validate that there are at least row result shown
    Wait Until Element Is Visible    ${banner_filter_result}