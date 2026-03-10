*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            http://www.amazon.com.br
${MENU_ELETRONICOS}    //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}    (//span[contains(.,'Eletrônicos e Tecnologia')])[1]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia
${CAMPO_DE_BUSCA}    //input[contains(@type,'text')]
${BOTAO_DE_PESQUISA}    //input[contains(@type,'submit')]


*** Keywords ***
Abrir o navegador
    Open Browser  browser=${BROWSER}
    Maximize Browser Window
 
Fechar o navegador
    #Capture Page Screenshot
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

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//span[@class='a-size-base-plus'][contains(.,'${NOME_CATEGORIA}')]

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=${CAMPO_DE_BUSCA}    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element   ${BOTAO_DE_PESQUISA} 

Verificar o resultado da pesquisa, se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=//img[@alt='${PRODUTO}']
    Click Element    locator=//img[@alt='${PRODUTO}']  

Adicionar o produto "Console Xbox Series S" no carrinho
    Wait Until Element Is Visible    locator=//input[@name='submit.add-to-cart']
    Click Element    locator=//input[@name='submit.add-to-cart']
    Wait Until Element Is Visible    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]
    Click Element    locator=//input[contains(@aria-labelledby,'attachSiNoCoverage-announce')]

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Page Should Contain Element    locator=//span[@class='a-truncate-cut'][contains(.,'Console Xbox Series S')]
