# frozen_string_literal: true

module Authentication
  module V1
    module Authentication
      # Resources api for users
      class Resources < Open::V1::AplicationResources
        desc 'Authentication' do
          detail 'User Authentication'
          tags ['authentication']
        end
        params do
          requires :email, type: String
          requires :password, type: String
        end
        post :login do
          interactor = UseCases::Authentication::UserGetToken
          request_args = interactor.parameters(params)
          Dry::Matcher::ResultMatcher.call(interactor.new(request_args).result) do |matcher|
            matcher.success do |response|
              success_response(response)
            end
            matcher.failure do |errors|
              error_response errors
            end
          end
        end
      end
    end
  end
end
