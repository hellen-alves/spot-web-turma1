#language: pt

Funcionalidade: Login
	Para que eu possa ter acesso a interface de administração de spots
	Sendo um usuário que possui um bom email
	Quero poder iniciar uma nova sessão
	
	
	Cenario: Nova sessao

	Quando eu submeto a sessão "leh@acme.com"
	Então devo ver a área de administração de spots

	# Usando o esquema de cenário pois há dois cenários com o mesmo comportamento
	Esquema do Cenario: Tentativa

	Quando eu submeto a sessão "<email>"
	Entao devo ver a mensagem de alerta: "<mensagem>"

	
	Exemplos:
	|email          |mensagem 						 |
	|leh$acme.com| Oops. Informe um email válido! |
	|               | Oops. Informe um email válido! |