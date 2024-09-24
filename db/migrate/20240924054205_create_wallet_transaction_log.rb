class CreateWalletTransactionLog < ActiveRecord::Migration[7.1]
  def change
    create_table :wallet_transaction_logs do |t|
      t.integer 'owner_id'
      t.string 'owner_type'
      t.decimal 'total', precision: 30, scale: 10
      t.string 'type', null: false
      t.timestamps
    end
  end
end
