class RandomGenerator
  require 'securerandom'
  attr_reader :email, :password

  def initialize
    @email = "#{SecureRandom.uuid}@mailinator.com"
    @password = SecureRandom.base64(12)
  end
end
