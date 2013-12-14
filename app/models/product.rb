class Product < ActiveRecord::Base
  has_many :line_items
  
  before_destroy :check_referenced_products
  validates :title, :description, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, format: {
    with: %r{\.(gif|jpg|png)\z}i,
    message: 'must be a link to an image in GIF, PNG, or JPG format.'
  }
  
  def self.latest
    Product.order(:updated_at).last
  end
  
  private
    def check_referenced_products
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
