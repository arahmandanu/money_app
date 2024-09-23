class Open::Middlewares::Authentication < Rack::Auth::AbstractHandler
  def call(env)
    auth = Request.new(env)

    return custom_error(401, ['Authorization should be provided']) unless auth.provided?

    return custom_error(401, ['Unauthorized']) unless auth.bearer?

    # challenge_token
    # do_validate_token(auth.token) << VALIDATE TOKEN HERE AND GET THE USER DETAIL
    # # return custom_error(400, ['User not found']) unless user.present?
    valid?(auth)
    env['token'] = auth.token
    status, headers, response = @app.call(env)
    [status, headers, response]
  end

  private

  def do_validate_token(token)
    byebug
  end

  def challenge
    'Bearer realm="%s"' % realm
  end

  def valid?(auth)
    @authenticator.call(auth.token)
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
