# frozen_string_literal: true

class Repositories::Stock::PurchaseStock < Repositories::AbstractRepository
  include Dry::Monads::Do.for(:call)
  def initialize(params, user: nil)
    @params = Hashie::Mash.new(params)
    @user = user
  end

  def call
    return failure('User must be provided') if @user.blank?

    wallet = @user.wallet
    return failure('Your balance is empty!') if wallet.blank?

    user_total_wallet = ActionController::Base.helpers.number_to_currency(wallet.total, unit: '', separator: '.',
                                                                                        delimiter: '').to_f
    stock = yield validate_stock(@params)
    current_stock_price = stock&.lastPrice
    total_price = current_stock_price * @params.total_purchase
    divided_money = user_total_wallet.to_f - total_price.to_f
    return Failure('Purchase cannot be made, exceeding wallet!') if divided_money <= 0

    wallet.total = divided_money.to_f
    if wallet.save
      # DO SAVE PURCHASING LOG HERE
      success stock
    else
      failure wallet.errors
    end
  end

  private

  def validate_stock(params)
    stock = Services::Stocks.new.get_by_identifier(params[:identifier])
    return Failure('Stock Not Found') if stock.blank?

    Success Hashie::Mash.new(stock[0])
  rescue StandardError
    Failure 'Failed to retrive stock'
  end
end