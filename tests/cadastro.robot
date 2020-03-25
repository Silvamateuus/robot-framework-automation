*** Settings ***
# Documentação
Documentation   Cadastros de jogos

# Importando biblioteca
Library     SeleniumLibrary


*** Test Cases ***
Cadastrar novo jogo
    open Browser                    http://localhost:3000/     chrome
    set Selenium Implicit Wait      5
    Click Link                      /produtos/new

    Input Text       id:produto_nome            Mario Word
    Input Text       id:produto_descricao       Jogo Nintendo
    Input Text       id:produto_preco           30.00
    Input Text       id:produto_quantidade      2

    #Click Element    /html/body/div/div/form/div[4]/input
    Click Element    xpath://input[@value='Criar Produto']

    # Validação
    Element Should Contain      css:div[role=alert]    Produto cadastrado com sucesso.
    Element Should Contain      css:table tbody        Mario

    Capture Page Screenshot
    Close Browser
