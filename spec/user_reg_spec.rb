# frozen_string_literal: true

feature 'Create a new user', js: true do
  before(:all) { @home_page = Home.new }

  after(:all) { File.delete(FileHelper::CREDS_PATH) }
  random = Time.now.to_i.to_s
  password = 'test123456'
  
  scenario 'Register user' do
    @home_page.load

    @home_page.menu.register.click

    @registration_page = RegistrationPage.new

    expect(@registration_page.current_url).to include('redmine/account/register')
  
    @registration_page.user_login.set "user#{random}"
    @registration_page.user_password.set password.to_s
    @registration_page.user_password_confirmation.set password.to_s
    @registration_page.user_firstname.set 'Test'
    @registration_page.user_lastname.set 'User'
    @registration_page.user_mail.set "test#{random}@test.com"

    @registration_page.submit_button.click
    expect(@home_page.menu.loggedas.text).to include("Logged in as user#{random}")
    
    save_user_creds(random, password)
  end
  
  scenario 'Login users' do
    @home_page.load
    @home_page.menu.login.click

    @login_page = LoginPage.new

    expect(@login_page.current_url).to include('redmine/login')

    credentials = read_user_creds
  
    @login_page.user_login.set credentials[:username]
    @login_page.user_password.set credentials[:password]
    @login_page.login_button.click
    expect(@home_page.menu.loggedas.text).to include("Logged in as user#{random}")
  end
end
