# frozen_string_literal: true

module Entities
  class AbstractEntity < Dry::Struct
    include Types
  end
end
