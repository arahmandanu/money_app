# frozen_string_literal: true

class Entities::User < Entities::AbstractEntity
  attribute :id, Types::Strict::Integer
  attribute :name, Types::Strict::String
  attribute :email, Types::Strict::String
end
