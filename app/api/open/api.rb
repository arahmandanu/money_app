# frozen_string_literal: true

require 'grape-swagger'
module Open
  class API < Grape::API
    include Open::Errors::ExceptionHandler
    use MyAuthentication::Extension
    Grape::Middleware::Auth::Strategies.add(:api_auth, Open::Middlewares::Authentication, lambda { |options|
      [options[:realm]]
    })

    auth :api_auth, { realm: 'Api authorization' } do |token|
      set_current_user(token)
      true
    end

    helpers Open::Helpers::CurrentUserHelpers
    helpers Open::Helpers::SuccessResponseHelpers
    helpers Open::Helpers::ErrorHandlerHelpers

    mount Open::V1::Users::Resources => '/v1/users'
    mount Open::V1::Wallets::Resources => '/v1/wallets'
    mount Open::V1::Stocks::Resources => '/v1/stocks'
    mount Open::V1::Purchased::Resources => '/v1/purchased'

    add_swagger_documentation \
      api_version: 'v1',
      hide_documentation_path: true,
      mount_path: 'doc',
      hide_format: true,
      doc_version: '1',
      array_use_braces: true,
      info: {
        title: 'Open Api V1',
        description: 'Documentation for Money APP APIS',
        contact_name: "Adrian Rahmandanu #{Date.today.year}"
      }
  end
end
