class UserCryptoController < ApplicationController
  def new
    # TODO save to session
    @user_crypto = UserCrypto.new

    puts "bill wuz here"
  end
end