# frozen_string_literal: true

require 'rails_helper'
RSpec.describe Open::V1::Purchased::Resources, type: :request do
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

  describe 'Open::V1::Purchased::Resources' do
    context 'valid params get singgle stock' do
      before do
        singgle_stock_stubber(response: singgle_stock, identier: 'NIFTY 50')
      end

      it 'should return user wallet' do
        post '/api/open/v1/purchased/stock', headers: { authorization: "bearer #{tokenizer.token}" },
                                             params: { identifier: 'NIFTY 50', total_purchase: 5 }
        expect(response).to have_http_status(201)
        wallet = actor.reload.wallet.total
        expect(ActionController::Base.helpers.number_to_currency(wallet, unit: '', separator: '.',
                                                                         delimiter: '')).to eq(JSON.parse(response.body)['data']['user']['wallet'])
      end
    end
  end
end
