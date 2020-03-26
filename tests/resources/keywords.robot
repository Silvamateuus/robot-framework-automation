# Dentro do robotframework tudo é plavra chave ele é 100% "Keywords"
# Por baixo de tudo são funções python que são abstraidas paras as palavras chaves do robot.
# BDD: Desenvolvimento guiado por comportamento



*** Settings ***
# Importando biblioteca do SeleniumLibrary
Library     SeleniumLibrary

# Importando arquivo elements.robots(Variaveis)
Resource    elements.robot


*** Variables ***
# Caminho da pagina principal
${BASE_URL}     http://localhost:3000


*** Keywords ***

### Ganchos
# Iniciar a sessão abrincdo o browser chrome
Inicia Sessao
    # Abre o browser
    Open Browser                    ${BASE_URL}     chrome
    # Timeout implicito - Tempo de espera para realizar as ações, até 5s.
    Set Selenium Implicit Wait      5

# Finalizando a sessão capturando um print e fechando o browser.
Encerra Sessao
    # Tira um print e salva no projeto
    Capture Page Screenshot
    # Fechando o browser
    Close Browser


### Steps
Dado que acesso o portal de cadastro de jogos
    # Goto: Direciona para pagina de cadastro
    Go To            ${BASE_URL}/produtos/new


Quando eu faço o cadastro de um novo jogo
    # Inserção dos valores nos campos inputs
    [Arguments]      ${nome}        ${desc}      ${preco}       ${qtd}

    Input Text       ${CAMPO_NOME}            ${nome}
    Input Text       ${CAMPO_DESC}            ${desc}
    Input Text       ${CAMPO_PRECO}           ${preco}
    Input Text       ${CAMPO_QTD}             ${qtd}
    Click Element    ${BTN_CRIAR_PROD}

    # Essa Key (Set Test Variable) é do Robot não é do Selenium.
    # Deixa a variavel "nome" que é recebida do gherkin para no escopo global.
    # Obs: Esta sendo utilizado no step (E vejo este novo jogo na lista)
    Set Test Variable      ${nome}

Então vejo a mesagem de sucesso "${mensagem_esperada}"
    # Validação da mesagem de sucesso.
    Element Should Contain      ${ALERTA_SUCESSO}    ${mensagem_esperada}


E vejo este novo jogo na lista
    #Validação do nome do jogo cadastrado.
    Element Should Contain      ${LISTA_JOGOS}        ${nome}


Então devo ver a mensagem de alerta "${mensagem_esperada}"
    # Validação das mensagens de erro
    Element Should Contain   ${ALERTA_ERRO}     ${mensagem_esperada}
    Capture Page Screenshot
