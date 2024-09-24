# frozen_string_literal: true

class Services::Stocks::PurchaseTransactionLog
  def initialize(params: nil)
    @params = Hashie::Mash.new(params)
  end

  def call
    # We can do async insert here
    PurchasedStockLog.create(@params)
  rescue StandardError
    # we can raise to rollbar here
    nil
  end
end
