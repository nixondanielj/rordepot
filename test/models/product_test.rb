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
    product = get_valid_product price: 5
    assert !product.errors[:price].any?
  end
  
  test "product price can be positive decimal" do
    product = get_valid_product price: 5.50
    assert !product.errors[:price].any?
  end
  
  test "image_url is a valid format" do
    ok = %w{ test.gif test.png test.jpg http://www.test.com/asdf_1234.jpg}
    ok.each do |url|
      assert get_valid_product(image_url: url).valid?, "#{url} should be a valid image_url"
    end
  end
end
