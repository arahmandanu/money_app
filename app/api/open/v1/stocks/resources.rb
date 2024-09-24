# frozen_string_literal: true

module Open
  module V1
    module Stocks
      # Resources api for Stocks
      class Resources < Open::V1::AplicationResources
        desc 'user list all stock' do
          detail 'List All Stock'
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

        desc 'user get detail stock' do
          detail 'Get Detail Stock'
          headers AUTHORIZATION_HEADERS
          tags ['stocks']
        end
        params do
          requires :identifier, type: String
        end
        get :by_identifier do
          interactor = UseCases::Stocks::UserGetDetailStock
          request_args = interactor.parameters(params.merge({ id: @current_user.id }))
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
