#language: pt

Funcionalidade: Cadastro de Spots
    Sendo um anunciante
    Quero poder cadastrar alguns spots de empresas
    Para que eu possa disponibilizar para locação

@smoke
Cenário: Novo spot
    
    Dado que estou logado como "leh@papito.io"
    E não tenho spots cadastrados
    E que eu tenha o seguinte spot:
        |company  |Google      |
        |thumbnail|google.jpg  |
        |techs    |java, golang|
        |price    |10          |
    E este é um novo spot
    Quando eu faço o cadastro dessas informações
    Então devo ver um novo spot com o valor da diária "R$10/dia"


Cenário: Spot grátis
    Dado que estou logado como "leh@yahoo.com"
    E não tenho spots cadastrados
    Dado que eu tenha o seguinte spot:
        |company  |Yahoo     |
        |thumbnail|yahoo.jpg |
        |techs    |elixir    |
        |price    |          |
    E este é um novo spot
    Quando eu faço o cadastro dessas informações
    Então devo ver um novo spot com o valor da diária "GRATUITO"


Esquema do Cenário: Cadastro incompleto

    Dado que estou logado como "leh@papito.io"
    E que eu tenha o seguinte spot:
        |company  |<company> |
        |thumbnail|<thumb>   |
        |techs    |<techs>   |
        |price    |<price>   |
    Quando eu faço o cadastro dessas informações
    Então devo ver uma mensagem de alerta "<message>" no dashboard

    Exemplos:
      | company | thumb     | techs  | price | message                              |
      | Yahoo   |           | elixir | 10    | Precisamos da foto da sua empresa!   |
      |         | yahoo.jpg | elixir | 20    | O nome da sua empresa é obrigatório! |
      | Yahoo   | yahoo.jpg |        | 30    | Informe pelo menos uma tecnologia :) |

