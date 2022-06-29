Recaptcha.configure do |config|
  config.public_key  = ENV['REACT_APP_SITE_KEY']
  config.private_key = ENV['REACT_APP_SECRET_KEY']
end
