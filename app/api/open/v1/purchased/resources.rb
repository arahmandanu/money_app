# frozen_string_literal: true

module Open
  module V1
    module Purchased
      # Resources api for Purchases Stock
      class Resources < Open::V1::AplicationResources
        resource 'stock' do
          desc 'purchasing stock' do
            detail 'Do Purchase Stock'
            headers AUTHORIZATION_HEADERS
            tags ['stocks']
          end
          get do
            interactor = UseCases::Stocks::UserListAll
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
end
