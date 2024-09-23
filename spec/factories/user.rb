# frozen_string_literal: true

FactoryBot.define do
  factory :user, class: 'User' do
    email { 'adrian@main.com' }
    name { 'some Name' }
    after :create do |object|
      create :auth, auth_able_type: object.class.name, auth_able_id: object.id
    end
  end
end
