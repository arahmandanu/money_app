# frozen_string_literal: true

class Repositories::Wallets::Deposit < Repositories::AbstractRepository
  def initialize(params: nil, user: nil)
    @params = Hashie::Mash.new(params)
    @user = user
  end

  def call
    wallet = @user.wallet
    wallet ||= @user.create_wallet(total: 0)
    current_total = wallet.total
    wallet.total = current_total + @params.total_money

    if wallet.save
      Services::Wallets::TransactionLog.new(
        params: { owner_id: @user.id, owner_type: @user.class,
                  total: @params.total_money }, transaction_type: DepositWalletLog
      ).call
      success @user.reload
    else
      failure wallet.errors
    end
  end
end
