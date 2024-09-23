# frozen_string_literal: true

class Builders::User < Builders::AbstractBuilder
  acts_as_builder_for_entity Entities::User

  def attributes_for_entity
    { created_at: @ar_model_instance.created_at.try(:to_datetime),
      updated_at: @ar_model_instance.updated_at.try(:to_datetime) }
  end
end
