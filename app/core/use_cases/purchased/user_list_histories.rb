# frozen_string_literal: true

module UseCases
  module Purchased
    class UserListHistories < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
        end
      end

      extend Forwardable

      include Dry::Monads[:result]
      include Dry::Monads::Do.for(:result, :validate_stock)

      def result
        valid_params = yield result_of_validating_params
        user = yield Repositories::Users::FindBy.new({ id: valid_params[:id] }).call
        return Success [] if user.purchased_stock_logs.blank?

        response = user.purchased_stock_logs.map { |log| Builders::Stock::PurchaseHistories.new(log).build }
        Success(response)
      end
    end
  end
end
