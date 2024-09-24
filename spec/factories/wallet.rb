# frozen_string_literal: true

FactoryBot.define do
  factory :wallet, class: 'Wallet' do
    total { 1_000_000 }
  end
end
