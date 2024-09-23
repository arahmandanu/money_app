# frozen_string_literal: true

FactoryBot.define do
  factory :auth, class: 'Auth' do
    encrypted_password { 'nopassword' }
  end
end
