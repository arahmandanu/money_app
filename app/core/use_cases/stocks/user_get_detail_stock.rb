# frozen_string_literal: true

module UseCases
  module Stocks
    class UserGetDetailStock < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
          required(:identifier).filled(:string)
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        Success(Services::Stocks.new.get_by_identifier(valid_params[:identifier]))
      end
    end
  end
end
