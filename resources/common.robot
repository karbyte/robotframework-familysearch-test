*** Settings ***
Library  SeleniumLibrary

*** Variables ***

#Test setup variables
${URL}  https://www.familysearch.org
${Browser}  Chrome
${CookieAcceptButton}  //*[@id="truste-consent-button"]

#001
${SignInButton}  //*[@id="signInLink"]
${UsernameTextField}  //*[@id="userName"]
${PasswordTextField}  //*[@id="password"]
${SignInButtonWithCreds}  //*[@id="login"]

#002
${SearchButton}  //*[@id="primaryNav"]/div[2]/button
${Catalog}  //*[@id="search"]/li[5]/a
${PlaceTextField}  //*[@id="placeName"]
${Birth}  Warszawa
${SurnameButton}  //*[@id="trigger_srnm"]
${SurnameTextField}  //*[@id="surname"]
${Surname}  Nowak
${TitleButton}  //*[@id="trigger_ttl"]
${TitleTextField}  //*[@id="title"]
${Title}  Pan
${RadioButtonGroup}  fhl-or-online
${RadioButtonId}  availability-fhl
${LocationList}  //*[@id="availability"]
${SearchMemberButton}  //*[@id="catalog-search"]/fieldset/fieldset/div/button[1]

#003
${SearchPhotoButton}  //*[@id="search"]/li[2]/a
${PhotoTextField}  //*[@id="main"]/div[2]/section/div[2]/ly-search-sidebar/div/section[1]/div[1]/div/label/span/ly-place-selector/div/div[1]/input
${PhotoLocationVariable}  Lublin

#004
${SiteMapTab}  //*[@id="global-footer"]/section[1]/nav/ul[1]/li[4]/a
${IGIbuttonSiteMap}  //*[@id="main-content-section"]/div/section[2]/ul/li[3]/a
${IGINameTextField}  //*[@id="givenName"]
${IGISearchButton}  //*[@id="search-form"]/div/div[2]/div/div[1]/button

#005
${VolunteerButton}  //*[@id="global-footer"]/section[1]/nav/ul[1]/li[2]/a

*** Keywords ***
Open Browser, Maximize Window and Accept Cookie
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${CookieAcceptButton}
    Click Button    ${CookieAcceptButton}

Sleep and Close Browser
    Sleep    2s
    Close Browser

Logging into user account
    [Arguments]  ${Username}  ${Password}
    Click Element    ${SignInButton}
    Wait Until Page Contains    Sign In
    Input Text    ${UsernameTextField}    ${Username}
    Input Password    ${PasswordTextField}    ${Password}
    Click Button    ${SignInButtonWithCreds}
    Wait Until Page Contains    Intellectual Reserve

Clicking catalog and wait for content
    Click Element    ${SearchButton}
    Click Element    ${Catalog}
    Wait Until Page Contains    Katalog FamilySearch

Search for a member
    [Arguments]  ${BirthPlace}
    Clicking catalog and wait for content
    Input Text    ${PlaceTextField}    ${BirthPlace}

Activating and writing surname
    [Arguments]  ${UserSurname}
    Click Element    ${SurnameButton}
    Wait Until Page Contains Element    ${SurnameTextField}
    Input Text    ${SurnameTextField}    ${Surname}

Activating and writing title
    Click Element    ${TitleButton}
    Wait Until Page Contains Element    ${TitleTextField}
    Input Text    ${TitleTextField}    ${Title}
    Textfield Should Contain    ${TitleTextField}    ${Title}
    Click Element    ${SearchMemberButton}
    Sleep    2s
    Wait Until Page Contains    Wyniki wyszukiwania  timeout=4

Search for a photo
    [Arguments]  ${PhotoLocation}
    Click Element    ${SearchButton}
    Click Element    ${SearchPhotoButton}
    Input Text    ${PhotoTextField}    ${PhotoLocationVariable}
    Press Keys    ${PhotoTextField}    RETURN

Get into Site Map tab
    Click Element    ${SiteMapTab}
    Wait Until Page Contains    Mapa strony FamilySearch

Get into IGI tab and search for a person
    Click Element    ${IGIbuttonSiteMap}
    Wait Until Page Contains    International Genealogical Index (IGI)
    Sleep    2s

Writing name into text field
    [Arguments]  ${IGIName}
    Input Text    ${IGINameTextField}    ${IGIName}
    Textfield Should Contain    ${IGINameTextField}    ${IGIName}
    Sleep    2s

Writing surname into text field
    [Arguments]  ${IGISurname}
    Input Text    ${SurnameTextField}    ${IGISurname}
    Textfield Should Contain    ${SurnameTextField}    ${IGISurname}
    Sleep    1s
    Click Element    ${IGISearchButton}
    Wait Until Page Contains    text

Clicking Volunteer tab 
    Click Element    ${VolunteerButton}
    Wait Until Page Contains    Volunteer Activities at FamilySearch
    
Getting into Learn More about history tab
    Click Link    link:Serve a Family History Mission
    Wait Until Page Contains    Full-Time Mission Opportunities

Getting on the form page
    Click Link    link: Contact Us