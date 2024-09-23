class CreateAuths < ActiveRecord::Migration[7.1]
  def change
    create_table :auths do |t|
      t.integer 'auth_able_id'
      t.string 'auth_able_type'
      t.string 'encrypted_password', default: '', null: false, index: { unique: true, name: 'unq_pass' }
      t.timestamps
    end
  end
end
