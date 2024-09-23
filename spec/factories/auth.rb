# frozen_string_literal: true

require 'bcrypt'
FactoryBot.define do
  factory :auth, class: 'Auth' do
    encrypted_password { BCrypt::Password.create('nopassword') }
  end
end
