*** Settings ***
# Documentação
Documentation   Cadastros de jogos

# Importando biblioteca
Library     SeleniumLibrary


*** Test Cases ***
# Nome do cenári
Cadastrar novo jogo
    # Abre o browser
    open Browser                    http://localhost:3000/     chrome
    # Tempo de espera para realizar as ações
    set Selenium Implicit Wait      5
    # Clicando no botão "Novo"
    Click Link                      /produtos/new
    # Inserção dos valores nos campos inputs
    Input Text       id:produto_nome            Mario Word
    Input Text       id:produto_descricao       Jogo Nintendo
    Input Text       id:produto_preco           30.00
    Input Text       id:produto_quantidade      2

    #Click Element    /html/body/div/div/form/div[4]/input
    Click Element    xpath://input[@value='Criar Produto']

    # Validação da mesagem de sucesso.
    Element Should Contain      css:div[role=alert]    Produto cadastrado com sucesso.
    # Validação do jogo cadastrado.
    Element Should Contain      css:table tbody        Mario
    # Tira um print e salva no projeto
    Capture Page Screenshot
    # Fechando o browser
    Close Browser
