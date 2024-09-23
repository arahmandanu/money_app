# frozen_string_literal: true

class Repositories::Users::GetToken < Repositories::AbstractRepository
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    user = User.find_by(email: @email)
    return failure(:user_not_found) unless user
    return failure(:credentials_not_valid) unless BCrypt::Password.new(user.auth.encrypted_password) == @password

    exist_token = user.auth.tokenizers.where(revoked_at: nil)
    exist_token.update(revoked_at: Time.now) if exist_token.present?
    new_token = create_new_token(user)

    if new_token
      success Builders::Authentication.new(new_token).build
    else
      failure(:user_not_found)
    end
  end

  private

  def create_new_token(user)
    params = {
      token: Digest::SHA1.hexdigest([Time.now, rand].join),
      expires_in: Time.now + 1.days
    }
    user.auth.tokenizers.create(params)
  end
end
