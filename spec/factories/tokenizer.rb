# frozen_string_literal: true

FactoryBot.define do
  factory :tokenizer, class: 'Tokenizer' do
    resource_owner_id { nil }
    token { SecureRandom.hex(10) }
    expires_in { 1.days.to_i }
    revoked_at { nil }
    created_at { Time.now }
  end
end
