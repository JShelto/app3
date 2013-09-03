OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'XR7q5njvj06ZXPtRaHtQ', 'x7FjFivTAfcItsaZAIUCD16oqf07RdxHrOd5MJKxIu0'
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '566242306746798', '9d416733aff0a0e40d070eb4c4186ce1'
end