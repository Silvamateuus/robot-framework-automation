# Dentro do robotframework tudo é plavra chave ele é 100% "Keywords"
# Por baixo de tudo são funções python que são abstraidas paras as palavras chaves do robot.

# BDD: Desenvolvimento guiado por comportamento

*** Settings ***
# Documentação
Documentation   Cadastros de jogos

# Importando biblioteca
Library     SeleniumLibrary

*** Test Cases ***

# Nome do cenário
Cadastrar novo jogo
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       19.99       10
    Então vejo a mesagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista
    E fechar o browser


Nome deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     ${EMPTY}      aventura na selva       19.99       10
    Então devo ver a mensagem de alerta "Nome não pode ficar em branco"
    E fechar o browser


preço deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       ${EMPTY}       10
    Então devo ver a mensagem de alerta "Preco não pode ficar em branco"
    E fechar o browser


Quantidade deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       19.99       ${EMPTY}
    Então devo ver a mensagem de alerta "Quantidade não pode ficar em branco"
    E fechar o browser




# ----------->  Desenvolvimentos dos testes (Keywords)


*** Keywords ***


Dado que acesso o portal de cadastro de jogos
    # Abre o browser
    open Browser                    http://localhost:3000/     chrome
    # Timeout implicito - Tempo de espera para realizar as ações, até 5s.
    set Selenium Implicit Wait      5
    # Clicando no botão "Novo"
    Click Link      /produtos/new


Quando eu faço o cadastro de um novo jogo
    # Inserção dos valores nos campos inputs
    [Arguments]      ${nome}        ${desc}      ${preco}       ${qtd}

    Input Text       id:produto_nome            ${nome}
    Input Text       id:produto_descricao       ${desc}
    Input Text       id:produto_preco           ${preco}
    Input Text       id:produto_quantidade      ${qtd}
    Click Element    xpath://input[@value='Criar Produto']

Então vejo a mesagem de sucesso "${mensagem_esperada}"
    # Validação da mesagem de sucesso.
    Element Should Contain      css:div[role=alert]    ${mensagem_esperada}


E vejo este novo jogo na lista
    #Validação do jogo cadastrado.
    Element Should Contain      css:table tbody        Mario
    # Tira um print e salva no projeto
    Capture Page Screenshot
    # Fechando o browser


E fechar o browser
    Close Browser


Então devo ver a mensagem de alerta "${mensagem_esperada}"
    Element Should Contain   class:alert-danger     ${mensagem_esperada}
    Capture Page Screenshot
    Close Browser