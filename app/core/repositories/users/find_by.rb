# frozen_string_literal: true

class Repositories::Users::FindBy < Repositories::AbstractRepository
  def initialize(params)
    @params = params
  end

  def call
    user = User.find_by(@params)

    if user
      # DTO
      success user
    else
      failure(:user_not_found)
    end
  end
end
