class RandomEmailAddress
  require 'securerandom'
  attr_reader :email

  def initialize
    @email = "#{SecureRandom.uuid}@mailinator.com"
  end
end