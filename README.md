# Fastwork-QA-Challenge-NattawutS

[![N|Solid](https://fastwork.co/blog/wp-content/uploads/2016/02/7390213503660.png)](https://github.com/NattJarhead/Fastwork-QA-Challenge-NattawutS)

This repository is only used for Fastwork.co interview process.
# Technology Choice: 
### Robotframework
Robot-framework has enough capabilities to run the full regressing testing for both API & UI. But yet simple enough for a non-coder to understand and eager to jump in and implement it. This enables the more promising rate of adoption to most of QA in Thailand industry. Moreover, it's also easy for maintenance and transition from each team/people in the future.
### Jmeter
Jmeter is a complete free tool yet powerful for performance testing.

# Test cases design
- [Google Sheet Link](https://docs.google.com/spreadsheets/d/18d_HIk39JjPpzZuVZ1-7cvVkOyGcW7ufUsom4GVQUMU)
- All test data is being omit to prevent actual credentail information that is used for test.
- Performance Test 
# Test Result
##### Status: `Partially Fail`
  - Test suite is forcus on "Login" & "Search" features.
  - Test aganist STG environment (https://staging.fastwork.co)
  - [Test Report Screenshot](https://drive.google.com/drive/u/1/folders/1KbjaKlKg_iDN5UKu3BxqpTNcp0t9kekE) | This is to omit actual credential information that use for my test

# Defect Summary
  - Search feature with white space; Service doesn't trim white space at the end but result in different search result. ( As of 11-Oct-2018)
    ```
    Reproduce step
       1. Type in search box with word 'card'
       2. Add single white space at the end
       3. Press enter to search
    Actual result:   126 count returned
    Expected result: 201 count returned
    ```
   ---
  - Search feature with catagories filter; Service fail to retrive the actual result. (This issue only occurs on STG, therer is no issue with production) ( As of 11-Oct-2018)
    ```
    Reproduce steps
       1. Type in search box with word 'Keatbuncha'
       2. Press enter to search
    Actual result:   0 count returned
    Expected result: 1 count returned
    ```
# How to run:
- Run cmd to setup your local machine:
  ```shell
    $ pip install -r requirements.txt
  ```
- Update test data in /resources/testdata/${env}/test_data.yaml
- Recheck env for test data & config folders.
- Tag is define for test case priorities.
- Execute robot run script.
  ```shell
    $ robot -v env:{env} -i {tag} testcases
  ```
 
# Project Structure
---
    - resources
      - config                  >>> Environment base configuration needed
        - dev
          - empty.yaml
        - staging
          - env_config.yaml
      - testdata                >>> Data test needed for each env
        - dev
          - empty.yaml
        - staging
          - test_data.yaml
      - imports.robot           >>> imports configurations and libraries
      - common_configs.yaml     >>> All configurations ie; End point
    - testcases
      - login
        - login_success.robot   >>> success scenarios
        - login_failure.robot   >>> failure scenarios
      - search
        - search.robot          >>> simple search scenarios
        - search_filter.robot   >>> search with category scenarios
    - keywords
      - api
      - ui
        - features              >>> keyword that base on features
          - login_keyword.robot
          - logout_keyword.robot
          - profile_keyword.robot
          - search_keyword.robot
        - pages                 >>> keyword that base on page
          - 3rd_party_pages.robot
      - common
        - common_keywords.robot >>> common keywords use acorss testsuites
    - perf            >>> performance script folder (normally, it should be in sperate folder)
    - requirements.txt          >>> needed for setup first time
    - README.md

---
# Feedback after testing
  - No UI format validation on username & password.
  - Low password strength (Only 8 characters rule) ; Security concern.
  - Need more consistency on UI implementation to support automation (identifier issue).
  - Some react component is being destroy on state change, which this cause difficaulty for an outsider to extract the locator. Ex; Profile Nav;

# Submitter
- Name:[Nattawut Sarojjitti](https://www.linkedin.com/in/nattawuts/)
- Email: sa.nuttawut@gmail.com