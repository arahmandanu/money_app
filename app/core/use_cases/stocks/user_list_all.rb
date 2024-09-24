# frozen_string_literal: true

module UseCases
  module Stocks
    class UserListAll < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        Success(Services::Stocks.new.get_all)
      end
    end
  end
end
