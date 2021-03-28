# frozen_string_literal: true

require 'rest-client'

module ApiWrapper
  def create_user
    @user = User.new

    response = RestClient.post "http://testautomate.me/redmine/users.json", 
                                {
                                  "user": {
                                    "login": @user.login,
                                    "firstname": @user.first_name,
                                    "lastname": @user.last_name,
                                    "mail": @user.email,
                                    "password": @user.password 
                                  }
                                }.to_json, 
                                {content_type: :json, 'x-redmine-api-key': '650c8cad5dedd0c8c9e5b917d1a48228498f8cfd'}

    print response
end
end