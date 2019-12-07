require './lib/coin_market_cap_client.rb'
#/home/bill/Github/count-dat-coin-api/lib/coin_market_cap_client.rb

class CryptoPricesController < ApplicationController
  REFRESH_INTERVAL = 10.minute.freeze

  def index
    CoinMarketCapResult.raw_response = CoinMarketCapClient.new.get_data if refresh_crypto_data?

    render json: JSON.parse(CoinMarketCapResult.raw_response)
  end

  private

  def refresh_crypto_data?
    return true if CoinMarketCapResult.has_data? == false
    return true if CoinMarketCapResult.data_age > REFRESH_INTERVAL
  end
end