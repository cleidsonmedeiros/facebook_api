class Post < ApplicationRecord
  has_one_attached :image
  has_many :likes
  has_many :comments

  validates :desc, presence: true
  
end
