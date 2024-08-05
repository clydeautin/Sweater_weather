class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :api_key, presence: true, uniqueness: true, allow_nil: true

  before_create :generate_api_key

  private

  def generate_api_key
    self.api_key = SecureRandom.hex(16) while !api_key || User.exists?(api_key: api_key)
  end
end