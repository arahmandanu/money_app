# frozen_string_literal: true

module UseCases
  module Wallets
    class UserGetWalletInfo < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        user = yield Repositories::Users::FindBy.new(id: valid_params[:id]).call
        Success(Builders::Wallets::WalletInfo.new(user).build)
      end
    end
  end
end
