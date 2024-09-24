# frozen_string_literal: true

module UseCases
  module Purchased
    class UserPurchaseStock < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
          required(:identifier).filled(:string)
          required(:total_purchase).filled(:integer)
        end
      end

      extend Forwardable

      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:result, :validate_stock)

      def result
        valid_params = yield result_of_validating_params
        user = yield Repositories::Users::FindBy.new({ id: valid_params[:id] }).call
        yield Repositories::Stock::PurchaseStock.new(valid_params, user:).call

        Success({ message: 'success purchase stock', user: Builders::Wallets::WalletInfo.new(user).build })
      end
    end
  end
end
