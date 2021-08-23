class UserCrypto
  include ActiveModel::Model

  attr_accessor :amount, :type, :id

  # TODO - logic to see if saved to session cookie
  def persisted?
    true
  end
end