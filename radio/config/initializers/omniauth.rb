OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '313243082125394', 'edcdcd9133f478c7d907d89ef737b7db'
end
