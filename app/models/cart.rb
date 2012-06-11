class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def add_product(product)
    current_item = line_items.where(:product_id => product.id).first
    if current_item
      current_item.quantity += 1
    else
     current_item = LineItem.new(:product_id => product.id, :price => product.price)
#     current_item.product = product
#     current_item.price = product.price
     line_items << current_item
     #current_item.price = current_item.product.price
    end
    current_item
  end

  def total_price
    line_items.all.sum {|item| item.total_price}
  end

  def total_items
    line_items.sum(:quantity)
  end
end
