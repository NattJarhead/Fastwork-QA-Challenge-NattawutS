*** Settings ***
Resource          ../../resources/imports.robot
Resource          ../../keywords/ui/features/search_keyword.robot
Suite setup       Open fastwork search page with   chrome
Suite teardown    close browser
Test setup        Run Keyword And Ignore Error     Cancel notification popup
Test teardown     Clear search text box

*** Test Cases ***
search_001 success - search with thai word
    [tags]    regression    high
    Search on text box with words   ${thai_target_word}
    Validate search content box    ${thai_target_word}      ${thai_target_count}

search_002 success - search with thai word with end white space
    [tags]    regression    high
    ${search_word}=    Catenate    ${thai_target_word}    ${empty_str}
    Search on text box with words   ${search_word}
    Validate search content box    ${thai_target_word}      ${thai_target_count}

search_003 success - search with thai word with start white space
    [tags]    regression    high
    ${search_word}=    Catenate    ${empty_str}    ${thai_target_word}
    Search on text box with words   ${search_word}
    Validate search content box    ${thai_target_word}      ${thai_target_count}

search_004 success - search with english word
    [tags]    regression    high
    Search on text box with words   ${eng_target_word}
    Validate search content box    ${eng_target_word}      ${eng_target_count}

search_005 success - search with english word with end white space
    [tags]    regression    high
    ${search_word}=    Catenate    ${eng_target_word}    ${empty_str}
    Search on text box with words   ${search_word}
    Validate search content box    ${eng_target_word}      ${eng_target_count}

search_006 success - search with english word with start white space
    [tags]    regression    high
    ${search_word}=    Catenate    ${empty_str}    ${eng_target_word}
    Search on text box with words   ${search_word}
    Validate search content box    ${eng_target_word}      ${eng_target_count}

search_007 success - search with english mix capital letter 1
    [tags]    regression    medium
    Search on text box with words   ${eng_target_word_Cap1}
    Validate search content box    ${eng_target_word_Cap1}      ${eng_target_count}

search_008 success - search with english mix capital letter 2
    [tags]    regression    medium
    Search on text box with words   ${eng_target_word_Cap2}
    Validate search content box    ${eng_target_word_Cap2}      ${eng_target_count}

#search_010  success - search with english word compatability with ie
#   Manual Test
#search_011  success - search with english word compatability with firefox
#   Manual Test
#search_012  success - search with english word compatability with safari
#   Manual Test