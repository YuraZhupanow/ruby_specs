# frozen_string_literal: true

require 'rest-client'

# module contains api requests to manage users
module ApiWrapper
  def create_user
    @user = User.new

    response = RestClient.post 'http://testautomate.me/redmine/users.json', 
                               {
                                 "user": {
                                   "login": @user.login,
                                   "firstname": @user.first_name,
                                   "lastname": @user.last_name,
                                   "mail": @user.email,
                                   "password": @user.password 
                                 }
                               }.to_json, 
                               { content_type: :json, 'x-redmine-api-key': '650c8cad5dedd0c8c9e5b917d1a48228498f8cfd' }

    JSON.parse(response.body)
  end

  def get_user(id)
    response = RestClient.get "http://testautomate.me/redmine/users/#{id}.json", 
                              { content_type: :json, 'x-redmine-api-key': '650c8cad5dedd0c8c9e5b917d1a48228498f8cfd' }
    received_user = JSON.parse(response.body)
    received_user['user']
  end
end
