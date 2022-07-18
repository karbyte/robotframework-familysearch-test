*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

*** Variables ***
${URL}  https://www.familysearch.org
${Browser}  Chrome

*** Test Cases ***
case_003 Search for a photo
    Open Browser  ${URL}  ${Browser}
    Maximize Window and Accept Cookie
    Authentication
    Search for a photo
    Sleep and Close Browser