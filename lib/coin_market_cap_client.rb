require 'net/http'
require 'uri'

class CoinMarketCapClient

  def initialize
    @uri = URI.parse("https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest")
    @uri.query = URI.encode_www_form({
      convert: "USD",
      limit:   "50",
      start:   "1",
    })
    @request = Net::HTTP::Get.new(@uri)
    @request["X-Cmc_pro_api_key"] = ENV['CMC_PRO_API_KEY']
    @request["Accept"] = "application/json"
    @req_options = {
      use_ssl: @uri.scheme == "https",
    }
  end

  def get_data
    response = Net::HTTP.start(@uri.hostname, @uri.port, @req_options) do |http|
      http.request(@request)
    end.body
  end
end