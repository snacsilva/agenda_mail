![agenda-edu](https://user-images.githubusercontent.com/2385859/60444694-11889500-9bf4-11e9-9e9b-cc1e10fe173a.gif)

#### Bem-vindo ao desafio

Estamos muito felizes que você tenha chegado nessa etapa do nosso processo seletivo, para essa fase, desejamos que você resolva um desafio.

O objetivo é criar uma API já para uma aplicação já existente de envio de mensagens.

#### Requisitos

- Criar endpoints da API: https://github.com/agendakids/desafio-backend-rails/blob/master/README.md#api
- Ter uma boa cobertura de código
- Organizar estrutura do projeto utilizando padrões de projetos

#### Critérios de avaliação

- Organização do projeto: Avalia a estrutura do projeto, documentação e uso de controle de versão;
- Coerência: Avalia se os requisitos foram atendidos;
- Boas práticas: Avalia se o projeto segue boas práticas de desenvolvimento, incluindo segurança e otimização;
- Controle de Qualidade: Avalia se o projeto possui qualidade assegurada por testes automatizados(RSpec) e integração contínua (por exemplo Circle Ci).

#### Requisitos bônus

Esses requisitos não são obrigatórios, mas serão levados em consideração como pontos extras no momento da avaliação.

- Evitar N + 1 nas queries;
- Integração contínua;

#### Processo de submissão

O desafio deve ser entregue pelo GitHub. A aplicação deve estar hospedada no Heroku ou AWS. As URLs devem ser enviadas por email.

Qualquer dúvida em relação ao desafio, responderemos por e-mail.

Bom trabalho!


## Documentação
----

**Agenda Mail**
----

Aplicação para troca de mensagens entre usuários.

Possui usuario master, que pode visualizar todas as mensangens, inclusive arquivadas.

Usuario Master:

email: master@email.com

password: 123456

#### Setup

```
bundle install
bundle exec rails db:setup
```

**API**
----

`METHOD` | `URL` | `PARAMS`

* **URL**

  `/api/v1`

* **Required**

  `token=[string]` get your token in profile page

  It's a constant value for master token

* **Permission**


  `permission=master` If is a admin request

----

* **Messages**

    `GET` | `/messages`

    example: `curl '/api/v1/messages?token=XXX'`

* **Create Message**

  `POST` | `/messages` | `message[title]=string&message[content]=string`

  example: `curl -X POST '/api/v1/messages' -d 'message[receiver_email]=matheus@email.com&message[title]=APITEST&message[content]=CONTEUDO&token=XXX'`

* **Sent**

    `GET` | `/messages/sent`

    example: `curl '/api/v1/messages/sent?token=XXX'`

* **Archived**

  `GET` | `/messages/archived` | `permision=master`

  example: `curl '/api/v1/messages/archived?token=XXXX&permission=master'`

* **Show Message**

  `GET` | `/messages/:id`

  example: `curl '/api/v1/messages/1?token=XXX'`

  OR `curl '/api/v1/messages/1?token=XXX&permission=master'`

* **Archive Message**

  `PATCH` | `/messages/:id/archive`

  example: `curl -X PATCH '/api/v1/messages/1/archive?token=XXX'`

* **Archive Multiples**

  `GET` | `/messages/archive_multiple` | `message_ids[]`

  example: `curl -g -X PATCH '/api/v1/messages/archive_multiple?token=XXX&message_ids[]=1&message_ids[]=2'`

----

* **Users**

  `GET` | `/users` | `permision=master`

  example: `curl '/api/v1/users?token=XXX&permission=master'`

* **User Messages*

  `GET` | `/users/:id/messages` | `permision=master`

  `curl '/api/v1/users/1/messages?token=XXX&permission=master'`

* **Update Profile**

  `PATCH` | `/users/:id` | `user[name]=string&user[email]=string&user[password]=string&user[password_confirmation]=string`

  example: `curl -g -X PATCH '/api/v1/users/1?token=XXX&user[name]=Mateus'`

