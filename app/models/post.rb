class Post < ApplicationRecord
  belongs_to :image
  has_many :comments
end
