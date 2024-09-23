# frozen_string_literal: true

require 'bcrypt'
class Auth < ApplicationRecord
  include BCrypt
  belongs_to :auth_able, polymorphic: true, optional: true
  has_many :tokenizers,
           class_name: 'Tokenizer',
           foreign_key: :resource_owner_id,
           dependent: :delete_all
end
