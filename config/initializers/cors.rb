# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: false, logger: -> { Rails.logger } do
  allow do
    origins 'http://localhost:3000', 'http://localhost:4200',
            'https://staging-hub2.qontak.com', 'https://staging-hub.qontak.com', 'https://staging-hub-chatbot-fe.qontak.com',
            'https://chat-hub-dev.qontak.net', 'https://bot.qontak.net',
            'https://chat.qontak.com', 'https://chatbot.qontak.com', 'https://test-chatbot-blue.qontak.com', 'https://chatbot-blue.qontak.com',
            'https://id-chatbot.qontak.com', 'https://app-chat.qontak.com',
            'https://development-chat.qontak.net', 'https://staging-chat.qontak.net',
            'https://test-chatbot.qontak.com', 'https://test-chat.qontak.com', 'https://test-bot.qontak.net',
            'https://commerce-mekari.qontak.net', 'https://commerce-mekari.qontak.com'

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head]
  end
end
