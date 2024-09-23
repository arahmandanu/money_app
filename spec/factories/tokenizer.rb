# frozen_string_literal: true

FactoryBot.define do
  factory :tokenizer, class: 'Tokenizer' do
    resource_owner_id { nil }
    token { SecureRandom.hex(10) }
    expires_in { Time.now + 1.days }
    revoked_at { nil }
  end
end
