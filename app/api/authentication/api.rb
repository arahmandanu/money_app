# frozen_string_literal: true

require 'grape-swagger'
module Authentication
  class API < Grape::API
    include Authentication::Errors::ExceptionHandler

    helpers Authentication::Helpers::CurrentUserHelpers
    helpers Authentication::Helpers::SuccessResponseHelpers
    helpers Authentication::Helpers::ErrorHandlerHelpers

    mount Authentication::V1::Authentication::Resources => '/v1'

    add_swagger_documentation \
      api_version: 'v1',
      hide_documentation_path: true,
      mount_path: 'doc',
      hide_format: true,
      doc_version: '1',
      array_use_braces: true,
      info: {
        title: 'Open Api V1',
        description: 'Documentation for Money APP APIS authentication',
        contact_name: "Adrian Rahmandanu #{Date.today.year}"
      }
  end
end
