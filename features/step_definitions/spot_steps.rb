Dado("que estou logado como {string}") do |email|
  @login.with(email)
  @dash.wait_until_dashboard_visible(wait: 5) # Customizar tempo especifico de espera para ese metodo

  js_script = "return window.localStorage.getItem('user');"
  @user_id = page.execute_script(js_script)
end

Dado("não tenho spots cadastrados") do
  MongoDb.new.remove_my_spots(@user_id)
end

Dado("que eu tenha o seguinte spot:") do |table|
  @spot_data = table.rows_hash # Paramêtro para coletar as informações da tabela em uma variavel
end

Dado("este é um novo spot") do
  MongoDb.new.remove_spot(@spot_data["company"], @user_id)
end

Quando("eu faço o cadastro dessas informações") do
  # puts @spot # Imprimi os dados da tabela em ruby
  # puts @spot["company"] # Imprime somente a empresa

  # Criei um id chamado thumb utilizando o javascript
  #   js_script = "document.querySelector('#thumbnail input').setAttribute('id', 'thumb')"
  #   page.execute_script(js_script)
  #   Capybara.ignore_hidden_elements = false # Propriedade do capybara para ignorar os elementos que são habilitados por padrão
  #   # Nesse caso visualiza elementos ocultos
  #   attach_file("thumb", thumbnail)
  #   Capybara.ignore_hidden_elements = true
  @dash.go_to_form
  @dash.form.create(@spot_data)
end

Então("devo ver um novo spot com o valor da diária {string}") do |price|
  expect(@dash.item(@spot_data["company"])).to have_text price
end

Então("devo ver uma mensagem de alerta {string} no dashboard") do |expect_message|
  expect(@dash.alert).to have_text expect_message
end
