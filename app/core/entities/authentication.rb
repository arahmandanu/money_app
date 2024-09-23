# frozen_string_literal: true

class Entities::Authentication < Entities::AbstractEntity
  attribute :type, Types::Strict::String
  attribute :token, Types::Strict::String
  attribute :expires_in, Types::Strict::Integer
end
