# frozen_string_literal: true

module UseCases
  module Authentication
    class UserGetToken < UseCases::AbstractUseCases
      contract do
        params do
          required(:email).filled(:string)
          required(:password).filled(:string)
        end
      end

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        # just example
        Repositories::Users::GetToken.new(email: valid_params[:email],
                                          password: valid_params[:password]).call
      end
    end
  end
end
