# frozen_string_literal: true

class Repositories::Wallets::Deposit < Repositories::AbstractRepository
  def initialize(params: nil, user: nil)
    @params = Hashie::Mash.new(params)
    @user = user
  end

  def call
    wallet = @user.wallet
    return failure('Wallet is empty!') unless wallet

    current_total = wallet.total
    wallet.total = current_total + @params.total_money

    if wallet.save
      # Do save Log HERE
      success @user.reload
    else
      failure wallet.errors
    end
  end
end
