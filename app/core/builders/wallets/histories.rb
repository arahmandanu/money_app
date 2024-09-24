# frozen_string_literal: true

class Builders::Wallets::Histories < Builders::AbstractBuilder
  acts_as_builder_for_entity Entities::WalletHistories
  has_many :wallet_transaction_logs, use: Builders::Wallets::WalletTransactionLog
end
