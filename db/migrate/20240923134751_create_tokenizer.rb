class CreateTokenizer < ActiveRecord::Migration[7.1]
  def change
    create_table :tokenizers do |t|
      t.integer 'resource_owner_id', null: false
      t.string 'token', null: false
      t.integer 'expires_in', null: false
      t.datetime 'revoked_at'
      t.timestamps
    end
  end
end
