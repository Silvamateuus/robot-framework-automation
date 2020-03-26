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
    Então vejo a mesagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista

Nome deve ser obrigatório
    Dado que acesso o portal de jogos
    Quando eu cadastro um produto sem nome
    Então devo ver a mensagem de alerta "Nome não pode ficar em branco"

preço deve ser obrigatório
    Dado que acesso o portal de jogos
    Quando eu cadastro um produto sempreço
    Então devo ver a mensagem de alerta "preço não pode ficar em branco"

Quantidade deve ser obrigatório
    Dado que acesso o portal de jogos
    Quando eu cadastro um produto sem quantidade
    Então devo ver a mensagem de alerta "quantidade não pode ficar em branco"


# Desenvolvimentos dos testes (Keywords)
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
    Input Text       id:produto_nome            Mario Word
    Input Text       id:produto_descricao       Jogo Nintendo
    Input Text       id:produto_preco           30.00
    Input Text       id:produto_quantidade      2
    #Click Element    /html/body/div/div/form/div[4]/input
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
    Close Browser


