*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    (//span[contains(.,'Eletrônicos e Tecnologia')])[1]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia




*** Keywords ***
Abrir o navegador
    Open Browser  browser=chrome
    Maximize Browser Window
 
Fechar o navegador
    Close Browser
    ##options=add_experimental_option("detach", True)

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}

Entrar no menu Eletrônicos
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se a frase "${FRASE}" é exibida
    Wait Until Page Contains    text=${FRASE} 
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página exibe "${TITULO}"
    Title Should Be    title=${TITULO}