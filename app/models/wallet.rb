# frozen_string_literal: true

class Wallet < ApplicationRecord
  belongs_to :owner, polymorphic: true, optional: true
end
