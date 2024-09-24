# frozen_string_literal: true

require 'bcrypt'
class AddInitialUser < SeedMigration::Migration
  def up
    return if User.exists?(email: 'initial_user@mail.com')

    user = User.create(name: 'initial user', email: 'initial_user@mail.com')
    if user.auth.present?
      user.auth.encrypted_password = BCrypt::Password.create('123456789')
      user.auth.save
    else
      user.create_auth(encrypted_password: BCrypt::Password.create('123456789'))
    end
  end

  def down
    user = User.find_by(email: 'initial_user@mail.com')
    return unless Models::Contact.exists?(email: 'initial_user@mail.com')

    user.auth.try(:destroy)
    user.try(:destroy)
  end
end
