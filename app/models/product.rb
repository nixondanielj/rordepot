class Product < ActiveRecord::Base
  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a link to an image in GIF, PNG, or JPG format.'
  }
end
