class User < ApplicationRecord
  has_secure_password

  has_many :meals
  has_many :workouts
  has_many :days

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :weight, presence: true, on: :setup
  validates :gender, presence: true, on: :setup
  validates :calories_target, presence: true, on: :setup
  validates :protein_target, presence: true, on: :setup
  validates :fat_target, presence: true, on: :setup
  validates :carbs_target, presence: true, on: :setup
  validates :fiber_target, presence: true, on: :setup
  validates :sugar_target, presence: true, on: :setup

  attr_reader :nutrition

  def self.omniauth_authenticate_or_create(auth)
    self.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['email']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(16)
    end
  end

  def nutrition=(hash)
    self.calories_target = hash[:calories] || 2000
    self.protein_target = hash[:protein] || self.weight
    self.fat_target = hash[:fat] || 50
    self.carbs_target = hash[:carbs] || 280
    self.fiber_target = hash[:fiber] || 26
    self.sugar_target = hash[:sugar] || (self.gender == "M" ? 36 : self.gender == "F" ? 25 : 30)
  end

  def nutrition
    if @nutrition.nil?
      hash = {
      :calories => self.calories_target,
      :protein => self.protein_target,
      :fat => self.fat_target,
      :carbs => self.carbs_target,
      :fiber => self.fiber_target,
      :sugar => self.sugar_target
      }
      @nutrition = hash
    end
    @nutrition
  end
end
