# Roboweek QA Ninja

Testando aplicação de vendas de games na linguagem Ruby utilizando roobotframework para criação dos testes automatizado.

### Instalar  dependencias:
    - $ gem install jquery-rails
    - $ sudo bundle install

###  Banco:
    -$ sudo bundle exec rails db:migrate

### Rodar?
    -$ bundle exec rails s


#### Outros Comandos 

Para executar o teste e salvar os logs do robotframework na pasta log da estrutura do ruby.
    - $ robot -d ./log  testes/cadastro.robot