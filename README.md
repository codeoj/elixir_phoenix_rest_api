# Pokémom PVP

Pokémom PVP é uma API REST JSON. Que inclui a criação de usuários, podendo visualizar as informações de um pokémon, e possibilita a formaçao de times pokémons.


- [Start](#start)
- [Infos](#infos)
- [User routes](#user-routes)
- [Pokemon route](#pokemon-route)
- [Pokemons user routes](#pokemons-user-routes)


## Start

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Run migrations with `mix ecto.migrate`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).


## Infos

- Interações com o banco de dados são feitas através do Ecto.
- Após receber as informações da Poke API, é aplicado um parse, para gerar uma lista menor de dados.
- É utilizado o Tesla para fazer alguns plugs no protocolo http, e criar um client com a Poke API.
- Ao criar um usuário, utiliza-se a biblioteca Argon para criptografar, e salvar um hash do password no banco de dados.

## User routes
### Request

#### create user
POST `http://localhost:4000/api/users`

Parâmetros: `Um nome, e um password maior que cinco caracteres`

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
GET `http://localhost:4000/api/users/036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a`

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

PUT `http://localhost:4000/api/users/036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a`

Parâmetros: `Um novo nome, e/ou um novo password`

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

DELETE `http://localhost:4000/api/users/036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a`

Parâmetros: `user id valido`

### Response

    HTTP/1.1 204 No Content
    {}

### Request

## Pokemon route

#### show a pokemon

GET `http://localhost:4000/api/pokemons/mr-mime`

Parâmetros: `nome de um pokemon valido`

### Response

    HTTP/1.1 200 OK
    {
        "id": 122,
        "moves": [
           ...
        ],
        "name": "mr-mime",
        "types": [
            "psychic",
            "fairy"
        ]
    }



## Pokemons user routes

### Request

#### create a pokemon user

POST `http://localhost:4000/api/user_pokemons`

Parâmetros: `nome do pokemon, e o id do usuário`

### Response

    HTTP/1.1 201 Created
    "message": "Pokemon Created",
    "pokemon": {
        "id": "97379eb6-f977-47dd-a689-a46ba5bf1f59",
        "inserted_at": "2022-04-13T13:20:24",
        "moves": [
            ...
        ],
        "name": "jynx",
        "types": [
            "ice",
            "psychic"
        ],
        "user_id": "036f7ffe-fdf6-4110-8ba3-7bd35f9cb77a"
    }




### Request

#### get a pokemon user

GET `http://localhost:4000/api/user_pokemons/02427352-73bf-4ef9-803d-55dd69a8d477`

Parâmetros: `id do user pokemon`

### Response

    HTTP/1.1 200 OK
    "pokemon": {
        "id": "02427352-73bf-4ef9-803d-55dd69a8d477",
        "inserted_at": "2022-04-13T12:28:58",
        "moves": [
           ...
        ],
        "name": "mr-mime",
        "types": [
            "psychic",
            "fairy"
        ],
        "user": {
            "user_id": "e696028b-4c34-4fd5-a2b4-a420e578d889",
            "user_name": "Oliver"
        }
    }

    


### Request

#### delete a pokemon user

DELETE `http://localhost:4000/api/user_pokemons/97379eb6-f977-47dd-a689-a46ba5bf1f59`

Parâmetros: `id do user pokemon`

### Response

    HTTP/1.1 204 No Content
    {}
