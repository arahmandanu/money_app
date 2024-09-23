# frozen_string_literal: true

module Open
  module V1
    module Users
      # Resources api for users
      class Resources < Grape::API
        desc 'list users all' do
          detail 'Detail path'
          tags ['paths']
        end
        get '' do
          interactor = UseCases::Users::UserListAll
          request_args = interactor.parameters(params)
          Dry::Matcher::ResultMatcher.call(interactor.new(request_args).result) do |matcher|
            matcher.success do |response|
              present(response:)
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
