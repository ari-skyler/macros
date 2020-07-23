class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :meals
  has_many :workouts
  has_many :dates

  def self.omniauth_authenticate_or_create(auth)
    self.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['email']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end
end
