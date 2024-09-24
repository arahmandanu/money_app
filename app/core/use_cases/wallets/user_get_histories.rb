# frozen_string_literal: true

module UseCases
  module Wallets
    class UserGetHistories < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        user = yield Repositories::Users::FindBy.new(valid_params).call
        Repositories::Wallets::GetHistories.new(user:).call
      end
    end
  end
end
