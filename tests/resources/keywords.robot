# Dentro do robotframework tudo é plavra chave ele é 100% "Keywords"
# Por baixo de tudo são funções python que são abstraidas paras as palavras chaves do robot.
# BDD: Desenvolvimento guiado por comportamento



*** Settings ***
# Importando biblioteca
Library     SeleniumLibrary


*** Variables ***
${BASE_URL}     http://localhost:3000


*** Keywords ***
### Ganchos
Inicia Sessao
    # Abre o browser
    Open Browser                    ${BASE_URL}     chrome
    # Timeout implicito - Tempo de espera para realizar as ações, até 5s.
    Set Selenium Implicit Wait      5


### Steps
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
