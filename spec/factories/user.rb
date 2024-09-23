# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'user@qontak.com' }
    password { 'Password1234567891011121314!' }
    is_admin { false }
    organization_id { nil }
  end
end
