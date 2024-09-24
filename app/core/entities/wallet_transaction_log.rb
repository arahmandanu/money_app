# frozen_string_literal: true

class Entities::WalletTransactionLog < Entities::AbstractEntity
  attribute :id, Types::Strict::Integer
  attribute :total, Types::Strict::Integer
  attribute :type, Types::Strict::String
  attribute :created_at, Types::Strict::Time
end
