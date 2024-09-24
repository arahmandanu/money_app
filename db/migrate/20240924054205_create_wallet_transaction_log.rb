class CreateWalletTransactionLog < ActiveRecord::Migration[7.1]
  def change
    create_table :wallet_transaction_logs do |t|
      t.integer 'owner_id'
      t.string 'owner_type'
      t.integer 'total'
      t.string 'type', null: false
      t.timestamps
    end
  end
end
