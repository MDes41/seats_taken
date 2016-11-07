class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  enum role: [:driver, :passenger]

end
