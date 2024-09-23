# frozen_string_literal: true

module UseCases
  module Users
    class UserListAll < UseCases::AbstractUseCases
      contract { params {} }

      extend Forwardable
      include Dry::Monads::Do.for(:result)

      def result
        valid_params = yield result_of_validating_params
        raise ActiveRecord::RecordNotFound
        Success(Hashie::Mash.new({ status: 'success', data: [] }))
      end

      def data
        Failure('asd')
      end
    end
  end
end
