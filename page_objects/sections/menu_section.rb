# frozen_string_literal: true

class MenuSection < SitePrism::Section
  element :login, 'a.login'
  element :register, 'a.register'
  element :loggedas, '#loggedas'
end
