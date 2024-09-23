# frozen_string_literal: true

require 'grape-swagger'
module Open
  class API < Grape::API
    include Open::Errors::ExceptionHandler

    helpers Open::Helpers::ErrorHandlerHelpers
    mount Open::V1::Users::Resources => '/v1/users'
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
