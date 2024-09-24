# frozen_string_literal: true

module LatestStockPrice
  require 'net/http'

  class ImmutableHeaderKey < String
    def capitalize
      self
    end

    def to_s
      self
    end

    alias to_str to_s

    def downcase
      self
    end

    def split(*)
      super.map { |s| self.class.new(s) }
    end
  end

  class Initiate
    def initialize(custom_headers: {})
      @base_url = ENV['RAPID_API_STOCK_URL']
      @headers = compile_headers(custom_headers)
    end

    def get(path)
      url = "#{@base_url}/#{path}"
      call(:get, url)
    end

    def compile_headers(custom_headers)
      new_headers = {
        'Accept' => 'application/json',
        'x-rapidapi-host' => ENV['RAPID_API_HOST'],
        'x-rapidapi-key' => ENV['RAPID_API_KEY']
      }.merge(custom_headers)
      new_headers.compact
    end

    private

    def call(type, url, body = {})
      uri = URI.parse(url)

      case type
      when :get
        request = Net::HTTP::Get.new(uri)
      end

      @headers.each do |k, v|
        request[ImmutableHeaderKey.new(k)] = v
      end
      request.body = body.to_json
      response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') { |http| http.request request }
      JSON.parse(response.body)
    end
  end
end
