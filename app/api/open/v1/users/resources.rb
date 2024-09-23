# frozen_string_literal: true

module Open
  module V1
    module Users
      # Resources api for users
      class Resources < Open::V1::AplicationResources
        desc 'get detail' do
          detail 'Detail path'
          headers AUTHORIZATION_HEADERS
          tags ['paths']
        end
        get '' do
          interactor = UseCases::Users::UserDetail
          request_args = interactor.parameters({ id: @current_user.id })
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
