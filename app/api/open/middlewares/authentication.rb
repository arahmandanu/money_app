class Open::Middlewares::Authentication < Rack::Auth::AbstractHandler
  def call(env)
    auth = Request.new(env)

    unless env['REQUEST_PATH'].eql?('/api/open/doc')
      return custom_error(401, ['Authorization should be provided']) unless auth.provided?
      return custom_error(401, ['Unauthorized']) unless auth.bearer?

      # challenge_token
      status, message, owner = do_validate_token(auth.token)
      return custom_error(401, [message]) unless status

      valid?(owner)
      env['owner'] = owner
    end
    status, headers, response = @app.call(env)
    [status, headers, response]
  end

  private

  def do_validate_token(bearer)
    record_token = Tokenizer.find_by(token: bearer)
    return [false, 'Unauthorized', nil] if record_token.blank?
    return [false, 'Token Revoked !'] if record_token.revoked_at.present?

    [true, nil, record_token.auth.auth_able]
  end

  def challenge
    'Bearer realm="%s"' % realm
  end

  def valid?(owner)
    @authenticator.call(owner)
  end

  def custom_error(status_code, messages = [], server_response = nil)
    response = server_response || {
      status: 'error',
      error: {
        code: status_code,
        messages:
      }
    }

    [status_code, { 'Content-Type' => 'application/json' }, [response.to_json]]
  end

  class Request < Rack::Auth::AbstractRequest
    def bearer?
      scheme == 'bearer' && valid_credentials?
    end

    def valid_credentials?
      @credentials ||= token.present?
    end

    def token
      params.try('split', 'bearer').try(:last).try(:strip)
    end
  end
end
