class User < ApplicationRecord
  has_many :posts
  
  extend Devise::Models  
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable            
  include DeviseTokenAuth::Concerns::User
end