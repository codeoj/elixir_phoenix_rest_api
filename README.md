# Pokémom PVP

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Run migrations with `mix ecto.migrate`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Description

Pokémom PVP é uma API REST JSON. Que inclui a criação de usuários, podendo visualizar as informações de um pokémon, e possibilita a formaçao de times pokémons, que poderão batalhar com times de outros usuários.

## Infos

- Interações com o banco de dados são feitas através do Ecto.
- Após receber as informações da Poke API, é aplicado um parse, para gerar uma lista menor de dados.
- É utilizado o Tesla para fazer alguns plugs no protocolo http, e criar um client com a Poke API.
- Ao criar um usuário, utiliza-se a biblioteca Argon para criptografar, e salvar um hash do password no banco de dados.

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
