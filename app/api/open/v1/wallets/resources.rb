# frozen_string_literal: true

module Open
  module V1
    module Wallets
      # Resources api for Wallets
      class Resources < Open::V1::AplicationResources
        desc 'get wallet info' do
          detail 'My Wallet Info'
          headers AUTHORIZATION_HEADERS
          tags ['wallets']
        end
        get :my_info do
          interactor = UseCases::Wallets::UserGetWalletInfo
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

        desc 'action wallet' do
          detail 'Do Action Wallet by User'
          headers AUTHORIZATION_HEADERS
          tags ['wallets']
        end
        params do
          requires :total_money, type: Integer, default: 0
          requires :transaction_type, type: String, values: %w[deposit withdraw]
        end
        post :action do
          interactor = UseCases::Wallets::UserDoTransactionWallet
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

        desc 'history wallet' do
          detail 'History Wallet transaction by User'
          headers AUTHORIZATION_HEADERS
          tags ['wallets']
        end
        post :my_histories do
          interactor = UseCases::Wallets::UserGetHistories
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
