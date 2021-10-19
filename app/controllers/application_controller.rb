require './lib/coin_market_cap_client.rb'

class ApplicationController < ActionController::Base

  REFRESH_INTERVAL = 10.minute.freeze

  before_action :refresh_crypto_data

  private

  def refresh_crypto_data
    if CoinMarketCapResult.has_data? == false || CoinMarketCapResult.data_age > REFRESH_INTERVAL
      CoinMarketCapResult.raw_response = CoinMarketCapClient.new.get_data
    end
  end
end
