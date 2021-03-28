# frozen_string_literal: true

feature 'Log in using user created by API call' do
  create_user

  @home_page = Home.new
  @home_page.load
  @home_page.menu.login.click

  login_user @user
end
  