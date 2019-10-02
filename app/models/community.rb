class Community < ApplicationRecord
  has_many :posts, dependent: :destroy
  belongs_to :user
end
