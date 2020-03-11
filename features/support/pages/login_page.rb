class LoginPage < SitePrism::Page
  set_url "/"
  element :input_email, "#email"
  element :alert, ".alert-dark"

  def with(email)
    self.input_email.set email
    #find("input[placeholder$='e-mail']") # O $ = termina com 'email', o * = contém, o ^ = começa com
    click_button "Entrar"
  end
end
