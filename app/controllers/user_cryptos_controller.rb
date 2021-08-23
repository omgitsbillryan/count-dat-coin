class UserCryptosController < ApplicationController

  def index
    @cryptos = saved_cryptos.map { |c| UserCrypto.new(c) }
  end

  def new
    # TODO save to session
    @user_crypto = UserCrypto.new
  end

  def create
    user_crypto = UserCrypto.new(params.permit(:amount, :type))
    user_crypto.id = saved_cryptos.size + 1

    saved_cryptos.push(user_crypto)

    redirect_to user_cryptos_path
  end

  def edit
    @crypto_from_session = saved_cryptos.find { |c| c['id'] == crypto_id }
    #@user_crypto = UserCrypto.new(crypto_from_session)
  end

  def update
    crypto_index = saved_cryptos.index { |c| c['id'] == crypto_id }

    user_crypto = UserCrypto.new(params.require(:user_crypto).permit(:amount, :type))

    saved_cryptos[crypto_index]['amount'] = user_crypto.amount
    saved_cryptos[crypto_index]['type']   = user_crypto.type

    redirect_to user_cryptos_path
  end

  private

  def saved_cryptos
    session[:cryptos] ||= []
  end

  def crypto_id
    params[:id].to_i
  end
end