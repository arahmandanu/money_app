# frozen_string_literal: true

class PurchasedStockLog < ApplicationRecord
  belongs_to :owner, polymorphic: true, optional: true
end
