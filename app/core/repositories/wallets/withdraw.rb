# frozen_string_literal: true

class Repositories::Wallets::Withdraw < Repositories::AbstractRepository
  def initialize(params: nil, user: nil)
    @params = Hashie::Mash.new(params)
    @user = user
  end

  def call
    wallet = @user.wallet
    return failure('Wallet is empty!') unless wallet
    return failure('Your transaction is too much!! please do more deposit!') if @params.total_money >= wallet.total

    current_total = wallet.total
    wallet.total = current_total - @params.total_money
    if wallet.save
      # Do save Log HERE
      success @user.reload
    else
      failure wallet.errors
    end
  end
end
