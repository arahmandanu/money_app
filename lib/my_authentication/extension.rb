# frozen_string_literal: true

module MyAuthentication
  module Extension
    def oauth2(*scopes)
      byebug
    end

    # Grape::API::Instance is defined in grape 1.2.0 or above
    grape_api = defined?(Grape::API::Instance) ? Grape::API::Instance : Grape::API
    grape_api.extend self
  end
end
