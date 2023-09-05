*** settings ***
Library 			SeleniumLibrary
Library 			Collections

# Command: robot web_assignment_001.robot

*** Variables ***
${URL}                      http://testphp.vulnweb.com/login.php
${LOGIN_USERNAME}			test
${LOGIN_PASSWORD}			test


# Elements - Login
${INPUT_LOGIN_USERNAME}     //input[@name='uname']
${INPUT_LOGIN_PASSWORD}     //input[@name='pass']
${BUTTON_LOGIN}             //input[@value='login']

# Elements - Global Nav
${GLOBAL_NAV_LOGOUT}        //div[@id='globalNav']//td[@align='right']//a
${TITLE_LOGOUT_MESSAGE}     Logout test

# Elements - Nav Bar
${NAV_BAR_BROWSE_CATEGORIES}        //div[@id='sectionLinks']//li//a[text()='Browse categories']

# Elements - Catagories Page
${CATEGOTIES_PAGE_TITLE}            //h2[@id='pageName']
${CATEGOTIES_PAGE_TITLE_MESSAGE}    categories
# ${CATEGOTIES_PAGE_STORY}            //div[@id='content']//div[@class='story'] 

*** Test cases ***
Automate Test Web Assignment 001
    # Visit
    Visit Website
    
    # Login
    Login Wtih Username And Password
    Verify Login Success

    # Nav Bar
    Click Browse Categories

    # Categories Page 
    Verify Visit Categories Page Success
    Check Categories In Categories Page

*** Keywords ***
Visit Website
    Open Browser 		${URL}   browser=chrome

# Login
Login Wtih Username And Password
    Input Text 			${INPUT_LOGIN_USERNAME}			${LOGIN_USERNAME}
    Input Text 			${INPUT_LOGIN_PASSWORD}			${LOGIN_PASSWORD}
    Click Element		${BUTTON_LOGIN}

Verify Login Success
    Wait Until Element Contains     ${GLOBAL_NAV_LOGOUT}        ${TITLE_LOGOUT_MESSAGE}  

# Nav Bar
Click Browse Categories
    Click Element       ${NAV_BAR_BROWSE_CATEGORIES}

# Categories Page
Verify Visit Categories Page Success
    Wait Until Element Contains     ${CATEGOTIES_PAGE_TITLE}    ${CATEGOTIES_PAGE_TITLE_MESSAGE} 

Check Categories In Categories Page
    Element Text Should Be          //div[@id='content']//div[@class='story'][1]//a   Posters  
    Element Text Should Be          //div[@id='content']//div[@class='story'][2]//a   Paintings    
    Element Text Should Be          //div[@id='content']//div[@class='story'][3]//a   Stickers
    Element Text Should Be          //div[@id='content']//div[@class='story'][4]//a   Graffity


# Check Categories In Categories Page
#     @LIST_CATEGORIES_PAGE       Posters   Paintings   Stickers    Graffity
#     @{categories} =  Get WebElements   ${CATEGOTIES_PAGE_STORY} 
#     @{data} =      Create List
#     FOR   ${category}    IN    @{categories}
#         ${text} =    Get Element Attribute    ${category}//a    innerText
#         Append To List   ${data}    ${text}
#     END
#     Lists Should Be Equal  ${LIST_CATEGORIES_PAGE}   ${data}

