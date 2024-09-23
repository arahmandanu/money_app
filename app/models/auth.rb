# frozen_string_literal: true

require 'bcrypt'
class Auth < ApplicationRecord
  include BCrypt
  before_save :encrypt_pass

  belongs_to :auth_able, polymorphic: true, optional: true
  has_many :tokenizers,
           class_name: 'Tokenizer',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  private

  def encrypt_pass
    Password.create(encrypted_password)
  end
end
