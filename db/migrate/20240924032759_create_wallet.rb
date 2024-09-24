class CreateWallet < ActiveRecord::Migration[7.1]
  def change
    create_table :wallets do |t|
      t.integer 'owner_id'
      t.string 'owner_type'
      t.integer 'total'
      t.timestamps
    end
  end
end
