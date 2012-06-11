class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :product, :price
  belongs_to :order
  belongs_to :product
  belongs_to :cart

  def total_price
    (price || product.price) * quantity
  end

  def decrement_line_item_quantity
#    if self.quantity > 1
#      self.quantity -= 1
#    else
#      self.destroy
#    end
#    self
    if quantity > 1
      self.quantity -= 1
    else
      destroy
    end
    self
  end

end
