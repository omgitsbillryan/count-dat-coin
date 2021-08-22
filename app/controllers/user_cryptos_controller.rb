class UserCryptosController < ApplicationController

  def index
    @cryptos = saved_cryptos.map { |c| UserCrypto.new(c) }
  end

  def new
    # TODO save to session
    @user_crypto = UserCrypto.new
  end

  def create
    user_crypto = UserCrypto.new(permitted_params)
    saved_cryptos.push(user_crypto)
    redirect_to user_cryptos_path
  end

  private

  def saved_cryptos
    session[:cryptos] ||= []
  end

  def permitted_params
    params.require(:user_crypto).permit(:amount, :type)
  end
end