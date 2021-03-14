# frozen_string_literal: true

# this module is responsible for saving & reading files
module FileHelper
  CREDS_PATH = 'data/creds.yml'

  def save_user_creds(random, password)
    creds = { username: "user#{random}", password: password }.to_yaml
    File.open(CREDS_PATH, 'w') do |file|
      file.puts creds
    end
  end

  def read_user_creds
    YAML.load_file(CREDS_PATH)
  end
end
