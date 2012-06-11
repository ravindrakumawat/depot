# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_setting = {
    address: "smtp.gmail.com",
    port: 587,
    domain: "sobin.robin@gmail.com",
    authentication: "plain",
    user_name: "sobin",
    password: "rubyonrails",
    enable_starttls_auto: true
  }
end
