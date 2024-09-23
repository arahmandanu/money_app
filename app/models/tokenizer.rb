# frozen_string_literal: true

class Tokenizer < ApplicationRecord
  belongs_to :auth, class_name: 'Auth', foreign_key: 'resource_owner_id'
end
