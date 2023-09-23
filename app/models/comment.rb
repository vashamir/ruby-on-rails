class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :body, presence: true, length: {minimum: 5}
end
