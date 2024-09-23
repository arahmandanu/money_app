# frozen_string_literal: true

class Auth < ApplicationRecord
  before_save :downcase_email

  belongs_to :auth_able, polymorphic: true, optional: true
  has_many :tokenizers,
           class_name: 'Tokenizer',
           foreign_key: :resource_owner_id,
           dependent: :delete_all

  private

  def downcase_email
    email.downcase!
  end
end
