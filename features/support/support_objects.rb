class RandomGenerator
  require 'securerandom'
  attr_reader :email, :password

  def initialize
    @email = @password = ''
  end

  def email
    @email = "#{SecureRandom.uuid}@mailinator.com"
  end

  def password
    @password = SecureRandom.base64(12)
  end
end
