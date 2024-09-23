# frozen_string_literal: true

GrapeSwaggerRails.options.before_action do |request|
  case request.path
  when '/open/_doc/'
    GrapeSwaggerRails.options.app_url = '/api/open/'
  when '/authentication/_doc/'
    GrapeSwaggerRails.options.app_url = '/api/authentication/'
  else
    raise 'No doc found!'
  end

  GrapeSwaggerRails.options.app_name = 'Money APP Documentation'
  GrapeSwaggerRails.options.url = 'doc'

  GrapeSwaggerRails.options.hide_url_input     = true
  GrapeSwaggerRails.options.hide_api_key_input = true
  GrapeSwaggerRails.options.api_key_name = 'Authorization'
  GrapeSwaggerRails.options.api_key_type = 'header'
  GrapeSwaggerRails.options.api_key_default_value = 'Bearer my_default_value'
end
