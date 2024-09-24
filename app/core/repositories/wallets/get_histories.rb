# frozen_string_literal: true

class Repositories::Wallets::GetHistories < Repositories::AbstractRepository
  def initialize(user: nil)
    @user = user
  end

  def call
    histories = @user.wallet_transaction_logs.order(created_at: :desc)
    success [] if histories.blank?
    success Builders::Wallets::Histories.new(@user).build
  end
end
