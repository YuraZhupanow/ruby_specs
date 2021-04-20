# frozen_string_literal: true

feature 'API actions on user' do
  # after(:all) { File.delete(UserHelper::CREDS_PATH) }

  scenario 'Log in using user created by API call' do
    # api call to create a user
    create_user

    @home_page = Home.new
    @home_page.load
    @home_page.menu.login.click

    credentials = read_user
    login_user credentials

    create_project
    @projects_page = ProjectsPage.new
    @projects_page.load
    expect(page).to have_current_path('/redmine/projects')
    expect(@projects_page.avaialble_projects).to have_link(@project.name)
  end
end
