OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_ID'], ENV['TWITTER_SECRET'] 
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET']
end