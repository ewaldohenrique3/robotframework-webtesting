# 🤖 Robot Framework - Web Testing (Amazon)

![Robot
Framework](https://img.shields.io/badge/Robot_Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Selenium](https://img.shields.io/badge/SeleniumLibrary-43B02A?style=for-the-badge&logo=selenium&logoColor=white)
![VS
Code](https://img.shields.io/badge/VS_Code-007ACC?style=for-the-badge&logo=visual-studio-code&logoColor=white)
![Status](https://img.shields.io/badge/status-em%20desenvolvimento-yellow?style=for-the-badge)

------------------------------------------------------------------------

# 📌 Sobre o Projeto

Este projeto é uma **automação de testes E2E Web** desenvolvida
utilizando **Robot Framework + SeleniumLibrary**.

O objetivo principal é **praticar automação de testes web, boas práticas
de organização de testes e reutilização de código**, simulando cenários
reais de navegação no site da **Amazon Brasil**.

O projeto também demonstra duas abordagens de escrita de testes:

-   Sintaxe tradicional do **Robot Framework**
-   Estrutura inspirada em **BDD utilizando Gherkin**

------------------------------------------------------------------------

# 🎯 Objetivos do Projeto

Este projeto foi criado com os seguintes objetivos:

-   Praticar **automação de testes web**
-   Aplicar **boas práticas com Robot Framework**
-   Implementar **reutilização de Keywords**
-   Criar uma **estrutura organizada de automação**
-   Utilizar **BDD com Gherkin**
-   Simular cenários reais de uso de e‑commerce

------------------------------------------------------------------------

# 🧪 Cenários de Teste Automatizados

## CT01 -- Navegação pelo menu Eletrônicos

Fluxo testado:

1.  Acessar a home page da Amazon
2.  Validar o título da página
3.  Acessar o menu **Eletrônicos**
4.  Validar a presença das categorias:
    -   Computadores e Informática
    -   Áudio e Som

------------------------------------------------------------------------

## CT02 -- Pesquisa de Produto

Fluxo testado:

1.  Digitar o nome de um produto na barra de pesquisa
2.  Clicar no botão de busca
3.  Validar se o produto aparece nos resultados

------------------------------------------------------------------------

## CT03 -- Adicionar Produto ao Carrinho

Fluxo testado:

1.  Buscar um produto
2.  Selecionar o produto nos resultados
3.  Adicionar ao carrinho
4.  Validar a confirmação de adição

------------------------------------------------------------------------

## CT04 -- Remover Produto do Carrinho

Fluxo testado:

1.  Acessar o carrinho
2.  Remover o produto
3.  Validar mensagem de remoção

------------------------------------------------------------------------

# 🧩 Estrutura do Projeto

    robotframework-webtesting
    │
    ├── amazon_testes.robot
    ├── amazon_testes_gherkin.robot
    ├── amazon_resources.robot
    │
    ├── log.html
    ├── report.html
    ├── output.xml
    │
    ├── README.md
    └── .gitignore

### amazon_testes.robot

Arquivo contendo os **testes automatizados na sintaxe tradicional do
Robot Framework**.

------------------------------------------------------------------------

### amazon_testes_gherkin.robot

Arquivo contendo cenários escritos utilizando **estrutura inspirada em
Gherkin (BDD)**.

Exemplo:

    Dado que acesso a home page da Amazon
    Quando digito "Xbox Series S" no campo de pesquisa
    E clico no botão de pesquisa
    Então o produto deve aparecer nos resultados

------------------------------------------------------------------------

### amazon_resources.robot

Arquivo responsável por centralizar:

-   Keywords reutilizáveis
-   Locators da página
-   Variáveis
-   Ações de navegação
-   Ações de validação

Isso melhora:

-   reutilização de código
-   manutenção da automação
-   organização dos testes

------------------------------------------------------------------------

# 🛠️ Tecnologias Utilizadas

-   Robot Framework
-   Python
-   SeleniumLibrary
-   Selenium WebDriver
-   Visual Studio Code
-   Git
-   GitHub

------------------------------------------------------------------------

# 🌐 Navegador Utilizado

![Chrome](https://img.shields.io/badge/Google%20Chrome-4285F4?style=for-the-badge&logo=googlechrome&logoColor=white)

------------------------------------------------------------------------

# 📋 Pré‑requisitos

Para executar o projeto é necessário ter instalado:

-   Python 3.9+
-   Robot Framework
-   SeleniumLibrary
-   Google Chrome
-   ChromeDriver compatível
-   Git

------------------------------------------------------------------------

# ⚙️ Instalação

Clone o repositório:

``` bash
git clone https://github.com/ewaldohenrique3/robotframework-webtesting.git
```

Entre na pasta do projeto:

``` bash
cd robotframework-webtesting
```

Instale as dependências:

``` bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

------------------------------------------------------------------------

# ▶️ Executando os Testes

Executar todos os testes:

    robot amazon_testes.robot

Executar os testes em formato BDD:

    robot amazon_testes_gherkin.robot

------------------------------------------------------------------------

# 📊 Relatórios de Execução

Após rodar os testes o Robot Framework gera automaticamente:

-   report.html
-   log.html
-   output.xml

Os relatórios permitem visualizar:

-   status dos testes
-   tempo de execução
-   logs detalhados
-   screenshots em caso de falha

------------------------------------------------------------------------

# 🚀 Próximas Melhorias

Algumas melhorias planejadas para o projeto:

-   Implementar **Page Object Pattern**
-   Adicionar **mais cenários de e‑commerce**
-   Criar **testes parametrizados**
-   Integrar execução em **pipeline CI/CD**
-   Adicionar execução **cross browser**