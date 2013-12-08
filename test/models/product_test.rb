require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def get_valid_product(title = 'Lorem Ipsum', description = 'test description', image_url = 'some_url.jpg', price = 19.95)
    Product.new(
      title: title,
      description: description,
      image_url: image_url,
      price: price
    )
  end
  
  test "product attributes are required for creation" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end
  
  test "product price can be positive integer" do
    product = get_valid_product
    product.price = 5
    assert !product.errors[:price].any?, "#{product.price} should be valid for product price"
    assert product.valid?
  end
  
  test "product price can be positive decimal" do
    product = get_valid_product
    product.price = 5.5
    assert !product.errors[:price].any?, "#{product.price} should be valid for product price"
    assert product.valid?
  end
  
  test "image_url can be a valid format" do
    ok = %w{ test.gif test.png test.jpg http://www.test.com/asdf_1234.jpg}
    ok.each do |link|
      product = get_valid_product
      product.image_url = link
      assert !product.errors[:image_url].any?, "#{link} should be valid for product image"
      assert product.valid?
    end
  end
end
