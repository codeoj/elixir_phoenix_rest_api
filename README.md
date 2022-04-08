# Anime List API

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Description
Anime List é uma API REST JSON, que interage com o banco de dados através do Ecto, ela faz interações com a API Jikan para solicitar as informações. Os dados recebidos podem ser visualizados, ou adicionados a um usuário.

## Features
- Após receber as informações da API Jikan, é aplicado um parse, para gerar uma lista menor de dados.
- É utilizado o Tesla para fazer alguns plugs no protocolo http, e criar um client com a Jikan API.
- Ao criar um usuário, utiliza-se a biblioteca Argon para criptografar, e salvar um hash do password no banco de dados.

### Request
#### create user  
`http://localhost:4000/api/users "name": "Um nome", "password": "maior_que_cinco_caracteres"`

Parâmetros: `"name": "Um nome", "password": "maior_que_cinco_caracteres"`

### Response
    
    
    HTTP/1.1 201 Created
    {
        "message": "User Created",
        "user": {
          "id": "036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a",
          "inserted_at": "2022-04-08T15:53:09",
          "name": "Um nome"
        }
    }



### Request
#### show user  
`http://localhost:4000/api/users/036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a`

Parâmetros: `user id valido`

### Response
    
    
    HTTP/1.1 200 OK
    {
       "id": "036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a",
       "inserted_at": "2022-04-08T15:53:09",
       "name": "Um nome"
    }
    
    
 
### Request
#### update user  
`http://localhost:4000/api/users/036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a`

Parâmetros: `user id valido` `name="Novo Nome", password="Novo_password"`

### Response
    
    
    HTTP/1.1 200 OK
    {
        "message": "User Updated",
        "user": {
           "id": "036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a",
           "inserted_at": "2022-04-08T16:18:58",
           "name": "Novo nome",
           "updated_at": "2022-04-08T16:20:05"
        }
    }



    
### Request
#### delete user  
`http://localhost:4000/api/users/036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a`

Parâmetros: `user id valido`

### Response
    
    
    HTTP/1.1 204 No Content
    {}
        
