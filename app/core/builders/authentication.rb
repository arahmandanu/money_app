# frozen_string_literal: true

class Builders::Authentication < Builders::AbstractBuilder
  acts_as_builder_for_entity Entities::Authentication

  def attributes_for_entity
    {
      type: 'bearer'
    }
  end
end
