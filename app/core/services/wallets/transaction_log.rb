# frozen_string_literal: true

class Services::Wallets::TransactionLog
  def initialize(params: nil, transaction_type: nil)
    @params = Hashie::Mash.new(params)
    @transaction_type = transaction_type
  end

  def call
    return if @transaction_type.blank?

    # We can do async insert here
    @transaction_type.create(@params)
  rescue StandardError
    # we can raise to rollbar here
    nil
  end
end
