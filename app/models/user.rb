# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email
  has_one :auth, as: :auth_able, dependent: :destroy, class_name: 'Auth'
  has_one :wallet, as: :owner, dependent: :destroy, class_name: 'Wallet'
  has_many :deposit_log, class_name: 'DepositWalletLog', foreign_key: 'owner_id', dependent: :destroy
  has_many :withdraw_log, class_name: 'WithdrawWalletLog', foreign_key: 'owner_id', dependent: :destroy
  has_many :wallet_transaction_logs, class_name: 'WalletTransactionLog', foreign_key: 'owner_id', dependent: :destroy

  private

  def downcase_email
    email.downcase!
  end
end
