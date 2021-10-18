class UserCrypto
  include ActiveModel::Model

  attr_accessor :amount, :type, :slug, :id

  # top 10 as of 10/16/2021
  # TODO implement autocomplete using entire CMC data
  SYMBOLS = ["BTC", "ETH", "BNB", "ADA", "USDT", "XRP", "SOL", "DOT", "USDC", "DOGE"].freeze
  #SYMBOLS = [["BTC", "bitcoin"], ["ETH", "ethereum"], ["BNB", "binance-coin"], ["ADA", "cardano"], ["USDT", "tether"], ["XRP", "xrp"], ["SOL", "solana"], ["DOT", "polkadot-new"], ["USDC", "usd-coin"], ["DOGE", "dogecoin"]].freeze

  # TODO - logic to see if saved to session cookie
  def persisted?
    true
  end
end