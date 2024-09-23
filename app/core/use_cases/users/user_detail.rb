# frozen_string_literal: true

module UseCases
  module Users
    class UserDetail < UseCases::AbstractUseCases
      contract do
        params do
          required(:id).filled(:integer)
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        # just example
        user = yield Repositories::Users::FindBy.new(valid_params).call
        Success(Builders::User.new(user).build)
      end
    end
  end
end
