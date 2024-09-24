# frozen_string_literal: true

class Builders::Wallets::WalletTransactionLog < Builders::AbstractBuilder
  acts_as_builder_for_entity Entities::WalletTransactionLog

  def attributes_for_entity
    {
      total: ActionController::Base.helpers.number_to_currency(@ar_model_instance.total, unit: '', separator: '.',
                                                                                         delimiter: ''),
      created_at: @ar_model_instance.created_at.is_a?(String) ? Time.parse(@ar_model_instance.created_at) : @ar_model_instance.created_at
    }
  end
end
