class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader
  
  has_many :comments, :dependent => :destroy
  
  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :receipe_text, presence: true, length: {minimum: 50}
  
end
