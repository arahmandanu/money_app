# frozen_string_literal: true

class Builders::Wallets::WalletInfo < Builders::AbstractBuilder
  acts_as_builder_for_entity Entities::Wallets::WalletInfo

  def attributes_for_entity
    total = get_total_wallet(ar_model_instance)
    {
      name: ar_model_instance.name
    }.merge(total)
  end

  private

  def get_total_wallet(user)
    wallet = if user.wallet.blank?
               0
             else
               user.wallet.total.to_s
             end

    { wallet: ActionController::Base.helpers.number_to_currency(wallet, unit: '', separator: '.',
                                                                        delimiter: '') }
  end
end
