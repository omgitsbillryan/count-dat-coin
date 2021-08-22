class UserCrypto
  include ActiveModel::Model

  attr_accessor :amount, :type

  # TODO - logic to see if saved to session cookie
  def persisted?
    false
  end
end