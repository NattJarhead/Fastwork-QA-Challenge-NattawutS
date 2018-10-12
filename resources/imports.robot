*** Settings ***
Variables    testdata/${env}/test_data.yaml
Variables    configs/${env}/env_config.yaml
Variables    testdata/common.yaml
Variables    common_configs.yaml
Variables    locator.yaml
Resource     ../keywords/common/common_keyword.robot
Library    String
Library    Selenium2Library
