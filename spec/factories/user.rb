# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'money_app@user.com' }
    name { 'some Name' }
  end
end
