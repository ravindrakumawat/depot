require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products
  test "add unique products" do
    cart = Cart.create
    book_one = products(:one)
    book_two = products(:two)
    cart.add_product(book_one).save!
    cart.add_product(book_two).save!
    assert_equal 2, cart.line_items.size
    assert_equal (book_one.price + book_two.price), cart.total_price
   end

  test "add_duplicate_product" do
    cart = Cart.create
    ruby_book = products(:ruby)
    assert_equal 0, cart.line_items.size
    cart.add_product(ruby_book).save!
    assert_equal 1, cart.line_items.size
    cart.add_product(ruby_book).save!
    assert_equal 1, cart.line_items.size
    cart.reload
    assert_equal (2 * ruby_book.price), cart.total_price
    assert_equal 2, cart.line_items[0].quantity
  end
end
