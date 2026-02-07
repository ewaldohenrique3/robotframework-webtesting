*** Settings ***
Documentation       Essa suite testa o site da Amazon.com.br
Resource            amazon_resources.robot
Test Setup          Abrir o navegador
# Test Teardown       Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Acesso ao menu Eletrônicos
    [Documentation]  Esse teste verifica o menu Eletrônicos do site da Amazon.com.br
    ...              e verifica a categoria Computadores e Informática
    [Tags]           menus  categorias
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página exibe "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu Eletrônicos
    Verificar se a frase "Eletrônicos e Tecnologia" é exibida
    Verificar se o título da página exibe "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se aparece a categoria "Computadores e Informática"
    Verificar se aparece a categoria "Áudio e Som"


# Caso de Teste 02 - Pesquisa de um Produto
#     [Documentation]  Esse teste verifica a busca de um produto
#     [Tags]           busca_produtos  lista_da_busca
#     Acessar a home page do site Amazon.com.br
#     Digitar o nome de produto "Xbox Series S" no campo de pesquisa
#     Clicar no botão de pesquisa
#     Verificar o resultado da pesquisa, se está listando o produto pesquisado