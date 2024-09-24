# frozen_string_literal: true

class Repositories::Wallets::GetInfo < Repositories::AbstractRepository
  def initialize(id: nil)
    @id = id
  end

  def call
    user = User.find_by(id: @id)

    if user
      # DTO
      success user
    else
      failure(:user_not_found)
    end
  end
end
