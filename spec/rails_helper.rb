# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

  def create_user
    User.create(email: "test@example.com", password: "password")
  end

  def login_user
    user = create_user
    visit login_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "password"

    click_on "enter"
  end

  def create_link
    title = "Sports!"

    visit links_path

    fill_in "link_title", with: title
    fill_in "link_url", with: "http://espn.go.com/"
    click_button "submit link"

    Link.find_by(title: title)
  end

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
