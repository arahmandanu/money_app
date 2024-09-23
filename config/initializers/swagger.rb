# frozen_string_literal: true

GrapeSwaggerRails.options.before_action do |request|
  GrapeSwaggerRails.options.app_name = 'Money APP Documentation'
  GrapeSwaggerRails.options.url = 'doc'
  GrapeSwaggerRails.options.app_url = '/api/open/'
  GrapeSwaggerRails.options.app_name = 'Swagger'
  GrapeSwaggerRails.options.hide_url_input = true
  GrapeSwaggerRails.options.hide_api_key_input = true
end
