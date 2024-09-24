# frozen_string_literal: true

class Entities::WalletHistories < Entities::AbstractEntity
  attribute :id, Types::Strict::Integer
  attribute :name, Types::Strict::String
  attribute :email, Types::Strict::String
  attribute :wallet_transaction_logs, Types.Array(Types.Instance(Entities::WalletTransactionLog))
end
