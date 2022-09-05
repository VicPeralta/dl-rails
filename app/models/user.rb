class User < ApplicationRecord
  before_create :add_token
  validates :password, presence: true, length: { minimum: 6 }

  private

  def generate_token
    SecureRandom.hex(10)
  end

  def add_token
    self.token = JwtHelper::JsonWebToken.encode(id)
  end
end
