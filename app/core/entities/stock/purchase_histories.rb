# frozen_string_literal: true

class Entities::Stock::PurchaseHistories < Entities::AbstractEntity
  attribute :identifier, Types::Strict::String
  attribute :total_purchase_item, Types::Strict::Integer
  attribute :total_price, Types::Strict::Float
  attribute :price_item, Types::Strict::Float
  attribute :time_purchase, Types::Strict::Time
end
