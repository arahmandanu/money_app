class CreatePurchasedStockLog < ActiveRecord::Migration[7.1]
  def change
    create_table :purchased_stock_logs do |t|
      t.integer 'owner_id'
      t.string 'owner_type'
      t.string 'identifier', null: false
      t.integer 'total_purchase_item'
      t.jsonb 'product', default: {}
      t.timestamps
    end
  end
end
