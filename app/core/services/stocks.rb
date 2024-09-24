# frozen_string_literal: true

class Services::Stocks
  def initialize
    @request = LatestStockPrice::Initiate.new
  end

  def get_all
    path = 'any'
    @request.get(path)
  end

  def get_by_identifier(identifier)
    path = "any?Identifier=#{identifier}"
    @request.get(path)
  end
end
