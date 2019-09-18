class Post < ApplicationRecord
  belongs_to :community, :user
  has_many :comments
end
