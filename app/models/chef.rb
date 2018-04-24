class Chef < ActiveRecord::Base
  has_many :recipes
  has_secure_password
end
