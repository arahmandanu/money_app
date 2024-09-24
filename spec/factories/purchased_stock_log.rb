# frozen_string_literal: true

FactoryBot.define do
  factory :purchased_stock_log, class: 'PurchasedStockLog' do
    total_purchase_item { 10 }
    identifier { 'some product' }
    product { { name: 'some product', lastPrice: 25_383.75 } }
  end
end
