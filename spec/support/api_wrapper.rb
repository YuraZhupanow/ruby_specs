# frozen_string_literal: true

require 'rest-client'

# module contains api requests to manage users
module ApiWrapper
  def create_user
    @user = User.new

    response = RestClient.post "#{ENV['ROOT_URL']}users.json",
                               {
                                 "user": {
                                   "login": @user.login,
                                   "firstname": @user.first_name,
                                   "lastname": @user.last_name,
                                   "mail": @user.email,
                                   "password": @user.password
                                 }
                               }.to_json,
                               api_header

    raise 'User was not created' unless response.code == 201

    JSON.parse(response.body)
  end

  def get_user(id)
    response = RestClient.get "#{ENV['ROOT_URL']}/users/#{id}.json",
                              api_header

    raise 'Can not fetch the user' unless response.code == 201

    received_user = JSON.parse(response.body)
    received_user['user']
  end

  def api_header
    { content_type: :json, 'x-redmine-api-key': ENV['ADMIN_API_KEY'] }
  end
end
