# Dentro do robotframework tudo é plavra chave ele é 100% "Keywords"
# Por baixo de tudo são funções python que são abstraidas paras as palavras chaves do robot.

# BDD: Desenvolvimento guiado por comportamento

*** Settings ***
# Documentação
Documentation   Cadastros de jogos

# Importando biblioteca
Library     SeleniumLibrary

# Inicio e fim da sessão
Suite Setup         Inicia Sessao
Suite Teardown      Encerra Sessao

*** Variables ***
${BASE_URL}     http://localhost:3000


*** Test Cases ***
Cadastrar novo jogo
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       19.99       10
    Então vejo a mesagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista


Nome deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     ${EMPTY}      aventura na selva       19.99       10
    Então devo ver a mensagem de alerta "Nome não pode ficar em branco"


preço deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       ${EMPTY}       10
    Então devo ver a mensagem de alerta "Preco não pode ficar em branco"


Quantidade deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       19.99       ${EMPTY}
    Então devo ver a mensagem de alerta "Quantidade não pode ficar em branco"


# ----------->  Desenvolvimentos dos testes (Keywords)


*** Keywords ***
### Ganchos
Inicia Sessao
    # Abre o browser
    Open Browser                    ${BASE_URL}     chrome
    # Timeout implicito - Tempo de espera para realizar as ações, até 5s.
    Set Selenium Implicit Wait      15


Encerra Sessao
    # Tira um print e salva no projeto
    Capture Page Screenshot
    # Fechando o browser
    Close Browser


Dado que acesso o portal de cadastro de jogos
    # Goto: Direciona para pagina de cadastro
    Go To            ${BASE_URL}/produtos/new


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
    #Validação do nome do jogo cadastrado.
    Element Should Contain      css:table tbody        Mario


Então devo ver a mensagem de alerta "${mensagem_esperada}"
    # Validação das mensagens de erro
    Element Should Contain   class:alert-danger     ${mensagem_esperada}
    Capture Page Screenshot
