class UserCrypto
  include ActiveModel::Model

  attr_accessor :amount, :type, :id

  # top 10 as of 10/16/2021
  # TODO implement autocomplete using entire CMC data
  SYMBOLS = ["BTC", "ETH", "BNB", "ADA", "USDT", "XRP", "SOL", "DOT", "USDC", "DOGE"].freeze

  # TODO - logic to see if saved to session cookie
  def persisted?
    true
  end
end