# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  port: 587,
  address: ENV['address'],
  domain: ENV['domain'],
  user_name: ENV['username'],
  password: ENV['password'],
  authentication: :plain
}