class Post < ApplicationRecord
  belongs_to :community
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
end
