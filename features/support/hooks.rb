require "report_builder"
# São ganchos

Before do
  # puts "Tudo aqui acontece antes do cenário"
  page.current_window.resize_to(1920, 1000)

  @login = LoginPage.new
  @dash = DashPage.new

  @login.load
end

# After do
#   # puts "Tudo aqui acontece depois do cenário"
#   temp_shot = page.save_screenshot("logs/temp_shot.png") # Capybara salva o print da tela
#   file_shot = File.open(temp_shot, "rb").read #Ruby lê e retorna o arquivo
#   final_shot = Base64.encode64(file_shot) # Ruby converte para binario
#   embed(final_shot, "image/png", "Screenshot") # Cucumber salva no report
# end

After do |scenario|
  sreenshot = page.save_screenshot("logs/screenshots/#{scenario.__id__}.png")
  embed(screenshot, "image/png", "Screenshots")
end

ReportBuilder.configure do |config|
  config.input_path = "logs/report.json"
  config.report_path = "logs/report"
  config.report_types = [:html]
  config.report_title = "Spotlab - Regression Tests"
  config.color = "indigo"
  config.compress_images = true
end
ReportBuilder.build_report
