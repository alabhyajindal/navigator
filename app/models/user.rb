class User < ApplicationRecord
  has_secure_password
  has_many :locations, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
