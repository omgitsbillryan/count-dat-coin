require './lib/coin_market_cap_client.rb'

class MainController < ApplicationController
  REFRESH_INTERVAL = 10.minute.freeze

  def index
    CoinMarketCapResult.raw_response = CoinMarketCapClient.new.get_data if refresh_crypto_data?

    @bill = 'cool'
  end

  private

  def refresh_crypto_data?
    return true if CoinMarketCapResult.has_data? == false
    return true if CoinMarketCapResult.data_age > REFRESH_INTERVAL
  end
end