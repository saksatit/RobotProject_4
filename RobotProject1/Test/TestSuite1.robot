*** Settings ***
Library    SeleniumLibrary    
Suite Setup    Log    This is inside Test Suite Setup    
Suite Teardown    Log    This is inside Test Suite Teardown    
Test Setup    Log    This is inside Test Case Setup    
Test Teardown    Log    This is inside Test Case Teardown 

Default Tags    Sanity   

*** Test Cases ***
MyFirstTest
    Log    This is my first test   
    
MySecondTest
    Log    This is my second test  
    
FirstSeleniumTest
    [Tags]    Smoke
    Open Browser    http://www.google.co.th    chrome
    Set Browser Implicit Wait    5
    Input Text    //input[@name='q']    saksatit 
    Press Keys    //input[@name='q']    ENTER
    Sleep    5          
    #Click Button    //div[@class='FPdoLc tfB0Bf']//input[@name='btnK']     
    Close Browser
    

SampleLoginTest
    [Documentation]    This is sample of login test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    15
    LoginKW    
    Sleep    5    
    Click Element    //a[@id='welcome']       
    Click Element    //a[contains(text(),'Logout')] 
    Sleep    5    
    Close Browser   
    Log    TestCompleted         
    Log    This test is executed by %{username} on %{os}     
    

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIAL}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text    //input[@id='txtUsername']    @{CREDENTIAL}[0]
    Input Password    //input[@id='txtPassword']    &{LOGINDATA}[password]
    Click Button    //input[@id='btnLogin']
    