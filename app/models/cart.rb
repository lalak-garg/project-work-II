class Cart < ApplicationRecord
  belongs_to :product
  belongs_to :payment
 
  def self.total
    self.all.map{|c| (c.product.price*c.quantity)}.sum
  end
end
