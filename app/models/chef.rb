class Chef < ActiveRecord::Base
  has_many :recipes
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
end
