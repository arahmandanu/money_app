# frozen_string_literal: true

module UseCases
  module Wallets
    class UserDoTransactionWallet < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
          required(:total_money).filled(:integer)
          required(:transaction_type).filled(:string, included_in?: %w[deposit withdraw])
        end
        rule(:total_money).validate(:validate_total_money)

        register_macro(:validate_total_money) do
          key.failure('Total Money cannot be 0') if values[:total_money].blank?
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        user = yield Repositories::Users::FindBy.new({ id: valid_params[:id] }).call
        yield get_user_wallet(user, valid_params[:transaction_type])
        if valid_params[:transaction_type].eql?('deposit')
          yield Repositories::Wallets::Deposit.new(params: valid_params, user:).call
        else
          yield Repositories::Wallets::Withdraw.new(params: valid_params, user:).call
        end

        Success(Builders::Wallets::WalletInfo.new(user).build)
      end

      private

      def get_user_wallet(user, transaction_type)
        wallet = user.wallet
        if transaction_type.eql?('withdraw') && (wallet.blank? || wallet.total.to_i.eql?(0))
          return Failure 'Wallet is empty!'
        end

        Success wallet
      end
    end
  end
end
