# frozen_string_literal: true

class Repositories::Tokenizers::Revoke < Repositories::AbstractRepository
  def initialize(token)
    @token = token
  end

  def call
    @token.revoked_at = Time.now

    if @token.save
      # DTO
      success 'success revoke token'
    else
      failure(:token_cant_be_revoked)
    end
  end
end
