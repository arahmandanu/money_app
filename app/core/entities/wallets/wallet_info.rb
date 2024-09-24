# frozen_string_literal: true

class Entities::Wallets::WalletInfo < Entities::AbstractEntity
  attribute :name, Types::Strict::String
  attribute :wallet, Types::Strict::String
end
