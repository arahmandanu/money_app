# frozen_string_literal: true

class Entities::Wallets::Wallet < Entities::AbstractEntity
  attribute :total, Types::Strict::Integer
end
