# frozen_string_literal: true

module UseCases
  class AbstractUseCases < CleanArchitecture::UseCases::AbstractUseCase
    include Dry::Monads[:result]
  end
end
