*** Settings ***
Library  SeleniumLibrary

*** Variables ***
#Accept cookie variable
${CookieAcceptButton}  //*[@id="truste-consent-button"]

#Authentication variables
${SignInButton}  //*[@id="signInLink"]
${UsernameTextField}  //*[@id="userName"]
${PasswordTextField}  //*[@id="password"]
${SignInButtonWithCreds}  //*[@id="login"]

#Member searching variables
${SearchButton}  //*[@id="primaryNav"]/div[2]/button
${Catalog}  //*[@id="search"]/li[5]/a
${PlaceTextField}  //*[@id="placeName"]
${SurnameButton}  //*[@id="trigger_srnm"]
${SurnameTextField}  //*[@id="surname"]
${TitleButton}  //*[@id="trigger_ttl"]
${TitleTextField}  //*[@id="title"]
${RadioButtonGroup}  fhl-or-online
${RadioButtonId}  availability-fhl
${LocationList}  //*[@id="availability"]
${SearchMemberButton}  //*[@id="catalog-search"]/fieldset/fieldset/div/button[1]

#Search for a photo
${SearchPhotoButton}  //*[@id="search"]/li[2]/a
${PhotoTextField}  //*[@id="main"]/div[2]/section/div[2]/ly-search-sidebar/div/section[1]/div[1]/div/label/span/ly-place-selector/div/div[1]/input

*** Keywords ***
Maximize Window and Accept Cookie
    Maximize Browser Window
    Wait Until Page Contains Element    ${CookieAcceptButton}
    Click Button    ${CookieAcceptButton}

Sleep and Close Browser
    Sleep    2s
    Close Browser

Authentication
    Click Element    ${SignInButton}
    Wait Until Page Contains    Sign In
    Input Text    ${UsernameTextField}    karbyte
    Input Password    ${PasswordTextField}    awds1234
    Click Button    ${SignInButtonWithCreds}
    Wait Until Page Contains    Intellectual Reserve

Search for a member
    Click Element    ${SearchButton}
    Click Element    ${Catalog}
    Wait Until Page Contains    Katalog FamilySearch
    Input Text    ${PlaceTextField}    Warszawa
    Click Element    ${SurnameButton}
    Wait Until Page Contains Element    ${SurnameTextField}
    Input Text    ${SurnameTextField}    Nowak
    Click Element    ${TitleButton}
    Wait Until Page Contains Element    ${TitleTextField}
    Input Text    ${TitleTextField}    Pan
    Click Element    ${SearchMemberButton}

Search for a photo
    Click Element    ${SearchButton}
    Click Element    ${SearchPhotoButton}
    Input Text    ${PhotoTextField}    Lublin
    Press Keys    ${PhotoTextField}    RETURN