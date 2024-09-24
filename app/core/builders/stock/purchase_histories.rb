# frozen_string_literal: true

class Builders::Stock::PurchaseHistories < Builders::AbstractBuilder
  acts_as_builder_for_entity Entities::Stock::PurchaseHistories

  def attributes_for_entity
    total_price = generate_total_price(ar_model_instance)
    {
      total_price:,

      time_purchase: ar_model_instance.created_at
    }
  end

  private

  def generate_total_price(log)
    product = Hashie::Mash.new(log.product)
    log.total_purchase_item * product.lastPrice
  end
end
