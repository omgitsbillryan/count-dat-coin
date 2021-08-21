# singleton responsible for holidng API response data from CoinMarketCap API

class CoinMarketCapResult
  class << self
    attr_accessor :raw_response
    attr_reader :fetched_at

    def raw_response=(val)
      @raw_response = val
      @fetched_at = Time.now
    end

    def has_data?
      !@raw_response.nil?
    end

    def data_age
      @raw_response.nil? ? nil : Time.now - @fetched_at
    end

    def data_fetch_timestamp
      ActiveSupport::Duration.build(data_age).ago
    end
  end
end