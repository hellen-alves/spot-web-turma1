class SpotForm < SitePrism::Section #Herda sessão
  element :thumbnail, "#thumbnail input"
  element :company, "input[placeholder*=empresa]"
  element :techs, "#techs"
  element :price, "#price"
  element :submit, "button[type=submit]"

  def create(spot)
    if spot["thumbnail"].size > 0
      thumb_file = Dir.pwd + "/features/support/images/" + spot["thumbnail"]
      thumbnail(visible: false).set thumb_file
    end

    company.set spot["company"]
    techs.set spot["techs"]
    price.set spot["price"]

    submit.click
  end
end

class DashPage < SitePrism::Page
  section :form, SpotForm, "#spotForm" # Busca somente elementos dentro desse id pai
  element :dashboard, ".dashboard"
  element :spot_list, ".spot-list li"
  element :alert, ".alert-error"

  def go_to_form
    click_button "Cadastrar novo spot"
  end

  def item(company)
    return spot_list(text: company) #validando o texto através da váriavel
  end
end
