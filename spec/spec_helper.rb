# frozen_string_literal: true

require 'capybara/rspec'
require 'require_all'
require 'pry'
require 'selenium-webdriver'
require 'site_prism'
require 'yaml'

require_all 'spec_helpers'
require_all 'page_objects/sections'
require_all 'page_objects/pages'

include FileHelper

RSpec.configure do
  def options
    Selenium::WebDriver::Chrome::Options.new(args: %w[window-size=1800,1000])
  end

  Capybara.default_driver = :selenium
  Capybara.register_driver :selenium do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
  end
end
