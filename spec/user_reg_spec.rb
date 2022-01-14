# frozen_string_literal: true

feature 'Create a new user', js: true do
  before(:all) { @home_page = Home.new }

  after(:all) { File.delete(UserHelper::CREDS_PATH) }
  
  scenario 'Register user' do
    @home_page.load
    expect(@home_page).to have_content('Home')

    @home_page.menu.register.click
    
    register_user
    
    expect(@home_page.menu.logged_as.text).to include("Logged in as #{@user.login}")
  end
  
  scenario 'Login user and check my page' do
    @my_page = MyPage.new
    @home_page.load
    @home_page.menu.login.click

    credentials = read_user

    login_user credentials
    expect(@home_page.menu.logged_as.text).to include("Logged in as #{credentials.login}")
    # verify that no issues are assigned on my-page
    @home_page.menu.my_page.click
    expect(page.current_url).to include('redmine/my/page')
    expect(@my_page.assigned_issues).to have_content('No data to display')
    expect(@my_page.reported_issues).to have_content('No data to display')
    @test
  end
end
