# frozen_string_literal: true

class User < ApplicationRecord
  before_save :downcase_email
  has_one :auth, as: :auth_able, dependent: :destroy, class_name: 'Auth'
  has_one :wallet, as: :owner, dependent: :destroy, class_name: 'Wallet'

  private

  def downcase_email
    email.downcase!
  end
end
