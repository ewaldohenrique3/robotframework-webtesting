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

Remover o produto "Console Xbox Series S" do carrinho
    Wait Until Element Is Visible    locator=//span[@class='a-icon a-icon-small-trash']
    Click Element    locator=//span[@class='a-icon a-icon-small-trash']
    
Verificar se o carrinho fica vazio
    Page Should Contain    foi removido de Carrinho de compras.
    Page Should Contain    0 produtos

#Gherkin Steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página exibe "Amazon.com.br | Tudo pra você, de A a Z."
    
Quando acessar o menu "Eletrônicos"
    Entrar no menu Eletrônicos

Então o título da página deve exibir "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página exibe "Eletrônicos e Tecnologia | Amazon.com.br"
    
E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se a frase "Eletrônicos e Tecnologia" é exibida

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Áudio e Som"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página exibe "Amazon.com.br : Xbox Series S"

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S"

Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E existe o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa, se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
    
Então o carrinho deve ficar vazio   
    Verificar se o carrinho fica vazio