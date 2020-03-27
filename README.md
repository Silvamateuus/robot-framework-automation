# Roboweek QA Ninja
Testando aplicação de vendas de games na linguagem Ruby utilizando roobotframework para criação dos testes automatizado.


### Instalar  dependencias:
    - $ gem install jquery-rails
    - $ sudo bundle install


###  Criando estrutura de Dados:
    -$ sudo bundle exec rails db:migrate
    -$ rails db:migrates


### Rodar:
    -$ bundle exec rails s
    -$ rails s


#### Outros comandos para o auxilio:
    Para executar o teste e salvar os logs do robotframework na pasta log da estrutura do ruby.
            - $ robot -d ./log  testes/cadastro.robot
