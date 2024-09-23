# frozen_string_literal: true

class Repositories::AbstractRepository
  include Dry::Monads[:result]

  alias failure Failure
  alias success Success
end
