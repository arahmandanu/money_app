# frozen_string_literal: true

class WalletTransactionLog < ApplicationRecord
  belongs_to :owner, polymorphic: true, optional: true
end
