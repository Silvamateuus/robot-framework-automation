# Dentro do robotframework tudo é plavra chave ele é 100% "Keywords"
# Por baixo de tudo são funções python que são abstraidas paras as palavras chaves do robot.

# BDD: Desenvolvimento guiado por comportamento

*** Settings ***
# Documentação
Documentation   Cadastros de jogos

Resource        resources/keywords.robot

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


