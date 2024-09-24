# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Open::V1::Stocks::Resources, type: :request do
  let(:actor) { create :user }
  let(:tokenizer) { create :tokenizer, resource_owner_id: actor.auth.id }

  before do
    actor
  end

  let(:singgle_stock) do
    [
      {
        "identifier": 'NIFTY 50',
        "change": 27.25,
        "dayHigh": 25_445.7,
        "dayLow": 25_336.2,
        "lastPrice": 25_383.75,
        "lastUpdateTime": '16-Sep-2024 16:00:00',
        "meta": {
          "companyName": nil,
          "industry": nil,
          "isin": nil
        },
        "open": 25_406.65,
        "pChange": 0.11,
        "perChange30d": 2.1,
        "perChange365d": 29.85,
        "previousClose": 25_356.5,
        "symbol": 'NIFTY 50',
        "totalTradedValue": 187_049_240_982.16,
        "totalTradedVolume": 168_694_880,
        "yearHigh": 25_445.7,
        "yearLow": 18_837.85
      }
    ]
  end

  let(:response_stocks_list) do
    [
      {
        "identifier": 'NIFTY 50',
        "change": 27.25,
        "dayHigh": 25_445.7,
        "dayLow": 25_336.2,
        "lastPrice": 25_383.75,
        "lastUpdateTime": '16-Sep-2024 16:00:00',
        "meta": {
          "companyName": nil,
          "industry": nil,
          "isin": nil
        },
        "open": 25_406.65,
        "pChange": 0.11,
        "perChange30d": 2.1,
        "perChange365d": 29.85,
        "previousClose": 25_356.5,
        "symbol": 'NIFTY 50',
        "totalTradedValue": 187_049_240_982.16,
        "totalTradedVolume": 168_694_880,
        "yearHigh": 25_445.7,
        "yearLow": 18_837.85
      },
      {
        "identifier": 'BAJFINANCEEQN',
        "change": -256.5,
        "dayHigh": 7680,
        "dayLow": 7322,
        "lastPrice": 7342,
        "lastUpdateTime": '16-Sep-2024 15:59:47',
        "meta": {
          "companyName": 'Bajaj Finance Limited',
          "industry": 'Non Banking Financial Company (NBFC)',
          "isin": 'INE296A13011'
        },
        "open": 7680,
        "pChange": -3.38,
        "perChange30d": 7.07,
        "perChange365d": -1.65,
        "previousClose": 7598.5,
        "symbol": 'BAJFINANCE',
        "totalTradedValue": 19_973_322_583.350002,
        "totalTradedVolume": 2_679_555,
        "yearHigh": 8192,
        "yearLow": 6187.8
      }
    ]
  end

  describe 'Open::V1::Stocks::Resources' do
    context 'valid params get all stock' do
      before do
        stock_all_stubber(response: response_stocks_list)
      end
      it 'should return user wallet info with http code (200)' do
        get '/api/open/v1/stocks', headers: { authorization: "bearer #{tokenizer.token}" }
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['data']).to eq(response_stocks_list.as_json)
      end
    end

    context 'valid params get singgle stock' do
      before do
        singgle_stock_stubber(response: singgle_stock, identier: 'NIFTY 50')
      end

      it 'should return user wallet info with http code (200)' do
        get '/api/open/v1/stocks/by_identifier', headers: { authorization: "bearer #{tokenizer.token}" },
                                                 params: { identifier: 'NIFTY 50' }
        expect(response).to have_http_status(200)
        expect(JSON.parse(response.body)['data']).to eq(singgle_stock.as_json)
      end
    end
  end
end
