# singleton responsible for holidng API response data from CoinMarketCap API

class CoinMarketCapResult
  class << self
    attr_writer :raw_response
    attr_reader :fetched_at, :parsed_response

    def raw_response=(val)
      @raw_response = val
      @fetched_at = Time.now
    end

    def parsed_response
      @parsed_response ||= JSON.parse(@raw_response)['data']
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