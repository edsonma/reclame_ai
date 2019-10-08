# README - Reclame Aí!
 
Aplicativo exemplo para abertura de reclamações de entregas de varejistas.

Versões:

* Ruby 2.6.3
* Rails 5.2.3
* Mysql 8.0.17

Utilização Local
* Clone esse projeto em um path local
* Configure mysql com login/passwd de devel: root:root@localhost (confs no db/config.rb)
* Crie tabelas e dados para teste com rake:
  - rake db:create
  - rake db:migrate
  - rake db:seed
* Clássico run server:  rails s 

Heroku - reclame-ai.herokuapp.com
* Precisa criar um banco mysql na cloud, utilizei o ClearDB Mysql - https://elements.heroku.com/addons/cleardb
* Após login no heroku
  - heroku run rake db:create
  - heroku run rake db:migrate
  - heroku run rake db:seed

Login:passwd da aplicação
   - admin@reclameai.com:admin
   - Nesse login consegue ver os Pedidos e as Reclamacões

Tela principal 
 - Possui um formulario para a pessoa preencher as reclamações
 
Hipoteses de teste de fraude:
  - Se o cep da reclamação não estiver em nenhum pedido, ALERTA!
  - Se o numero do pedido não existir na base de pedidos, ALERTA!
  - Se a geolocalização do pedido é fora do Brasil, ALERTA!
  - Todo: buscar se a geolocalização da reclamação foi criada pouco tempo e muito distante do endereço de entrega

Todo: 
  * Faltou testes
  * Melhorar o seed.rb
