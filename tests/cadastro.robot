# Dentro do robotframework tudo é plavra chave ele é 100% "Keywords"
# Por baixo de tudo são funções python que são abstraidas paras as palavras chaves do robot.


*** Settings ***
# Documentação
Documentation   Cadastros de jogos

# Importando arquivo keywords(codigos)
Resource        resources/keywords.robot

# Inicio e fim da sessão
Suite Setup         Inicia Sessao
Suite Teardown      Encerra Sessao

# Variaveis auxiliares
*** Variables ***
${BASE_URL}     http://localhost:3000


# Cenarios de testes
*** Test Cases ***
Cadastrar novo jogo
    # Teste de fumaça (mais importante da minha suite de teste)
    [tags]  smoke
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    #Inserção dos valores nos campos
    ...     pitfal      aventura na selva       19.99       10
    Então vejo a mesagem de sucesso "Produto cadastrado com sucesso."
    E vejo este novo jogo na lista


Nome deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     ${EMPTY}      aventura na selva       19.99       10
    Então devo ver a mensagem de alerta "Nome não pode ficar em branco"


preço deve ser obrigatório
    # Para rodar somente o cenario bugado (roobot -d ./log -i bug <feature>)
    [tags]  bug
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       ${EMPTY}       10
    Então devo ver a mensagem de alerta "Preço não pode ficar em branco"


Quantidade deve ser obrigatório
    Dado que acesso o portal de cadastro de jogos
    Quando eu faço o cadastro de um novo jogo
    ...     pitfal      aventura na selva       19.99       ${EMPTY}
    Então devo ver a mensagem de alerta "Quantidade não pode ficar em branco"


