class UserCryptosController < ApplicationController

  def index
    # TODO get cryptos from session
    @crypto = [UserCrypto.new(amount: 1, type: 'BTC'), UserCrypto.new(amount: 2.5, type: 'ETH')]
  end

  def new
    # TODO save to session
    @user_crypto = UserCrypto.new
  end

  def create
    @crypto = UserCrypto.new
  end
end