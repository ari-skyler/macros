class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  has_many :meals
  has_many :workouts
  has_many :dates
end
