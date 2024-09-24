class CreatePurchasedStockLog < ActiveRecord::Migration[7.1]
  def change
    create_table :purchased_stock_logs do |t|

      t.timestamps
    end
  end
end
