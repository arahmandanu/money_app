# frozen_string_literal: true

FactoryBot.define do
  factory :wallet_transaction_log, class: 'WalletTransactionLog' do
    # before(:create) do
    #   self.owner = create(:user, email)
    # end
    type { WithdrawWalletLog }
    total { 1000 }
    created_at { Time.now }
    updated_at { Time.now }
  end

  factory :withdraw, class: 'WithdrawWalletLog' do
    # before(:create) do
    #   self.owner = create(:user)
    # end
    total { 1000 }
    created_at { Time.now }
    updated_at { Time.now }
  end

  factory :deposit, class: 'DepositWalletLog' do
    # before(:create) do
    #   self.owner = create(:user)
    # end
    total { 1000 }
    created_at { Time.now }
    updated_at { Time.now }
  end

  factory :withdraw_log, parent: :withdraw
  factory :deposit_log, parent: :deposit
end
