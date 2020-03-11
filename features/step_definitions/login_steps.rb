Quando("eu submeto a sessão {string}") do |email|
  @login.with(email)
end

Então("devo ver a área de administração de spots") do
  expect(@dash.has_dashboard?).to be true

  # usando o capybara puro
  #   res = page.has_css?(".dashboard")
  #   expect(res).to be true
  #   expect(page).to have_css(".dashboard")
end

Entao("devo ver a mensagem de alerta: {string}") do |expect_alert|
  expect(@login.alert).to have_text(expect_alert)
end
