#language: pt

Funcionalidade: Login do saucedemo
    Descrição:

Contexto:
    Dado que acesso o site "https://www.saucedemo.com/v1/"

Cenário: Login válido
    Quando eu informo o usuário válido "standart_user"
    E digito a senha "secret_sauce"
    E confirmar
    Então exibe a tela de produtos

Esquema do Cenário: Falhas no login
    Quando eu informo o <usuário>
    E digito a <senha>
    O confirmo
    Então exibe a <mensagem> de erro
    Exemplos:
    | usuário           | senha         | mensagem
    | "invalid_user"    | "secret_sauce"| "Epic sadface: Username and password do not match any user in this service"   |
    | "standart_user"   | "invalid_pwd" | "Epic sadface: Username and password do not match any user in this service"   |
    | "locked_out_user" | "secret_sauce"| "Epic sadface: Sorry, this user has been locked out."                         |
    | ""                | "senha"       | "Epic sadface: Username is required"                                          |
    | "usuario"         | ""            | "Epic sadface: Password is required"                                          |
    | ""                | ""            | "Epic sadface: Username is required"                                          |


Cenário: Login com usuário inválido
    Quando eu informo o usuário válido "standart_user"
    E digito a senha "secret_sauce"
    E confirmar
    Então exibe um texto "Epic sadface 

Cenários: Login com senha inválida
    Quando eu insiro um usuário válido
    E eu insiro uma senha inválida
    E eu clico no botão de login
    Então devo ver uma mensagem de erro informando que as credenciais estão incorretas

Cenários: Tentativa de login com usuário bloqueado
    E o usuário está bloqueado
    Quando eu insiro o usuário bloqueado
    E eu insiro uma senha válida
    E eu clico no botão de login
    Então devo ver uma mensagem informando que o usuário está bloqueado

Cenários: Login de usuário com campos de usuários vazios
    Quando eu deixo o campo de usuário vazio
    E eu insiro uma senha válida
    E eu clico no botão de login
    Então devo ver uma mensagem de erro informando que o campo de usuário é obrigatório

Cenários: Login de usuário com campo de senha vazio 
    Quando eu insiro um usuário válido
    E eu deixo o campo de senha vazio
    E eu clico no botão de login
    Então devo ver uma mensagem de erro informando que o campo de senha é obrigatório

Cenários: Tentativa de login com todos os campos vazios
    Quando eu deixo o campo de usuário vazio
    E eu deixo o campo de senha vazio
    E eu clico no botão de login
    Então devo ver uma mensagem de erro informando que os campos de usuário e senha são obrigatórios