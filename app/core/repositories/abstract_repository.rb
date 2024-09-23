# frozen_string_literal: true

require 'bcrypt'
class Repositories::AbstractRepository
  include Dry::Monads[:result]
  include BCrypt

  alias failure Failure
  alias success Success
end
