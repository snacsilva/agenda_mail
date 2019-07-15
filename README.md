## Documentação
----

## Demo
----

https://mail-agenda.herokuapp.com/

Pegar o token no perfil do usuário para testes com a Api.


----
**Agenda Mail**
----

Aplicação para troca de mensagens entre usuários.

Possui usuario master, que pode visualizar todas as mensangens, inclusive arquivadas.

Usuario Master:

email: master@email.com

password: 123456

E possui também um usuário normal, para realização dos testes.

Usuário Normal:

email: samantha@email.com

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

  example: `curl -X POST '/api/v1/messages' -d 'message[receiver_email]=samantha@email.com&message[title]=APITEST&message[content]=CONTEUDO&token=XXX'`

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

