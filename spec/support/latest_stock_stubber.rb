# frozen_string_literal: true

module LatestStockStubber
  REQUEST_HEADERS_PAYLOAD = {
    'Accept' => 'application/json',
    'x-rapidapi-host' => ENV['RAPID_API_HOST'],
    'x-rapidapi-key' => ENV['RAPID_API_KEY'],
    'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3'
  }.freeze
  private_constant :REQUEST_HEADERS_PAYLOAD

  def stock_all_stubber(body: {}, response: {}, status: 200)
    stub_request(:get, "#{ENV['RAPID_API_STOCK_URL']}/any")
      .with(
        body: body.to_json,
        headers: REQUEST_HEADERS_PAYLOAD
      )
      .to_return(status:, body: response.to_json, headers: {})
  end

  def singgle_stock_stubber(identier: '', body: {}, response: {}, status: 200)
    stub_request(:get, "#{ENV['RAPID_API_STOCK_URL']}/any?Identifier=#{identier}")
      .with(
        body: body.to_json,
        headers: REQUEST_HEADERS_PAYLOAD
      )
      .to_return(status:, body: response.to_json, headers: {})
  end
end
