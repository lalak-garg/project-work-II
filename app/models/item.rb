class Item < ApplicationRecord
  belongs_to :product
  belongs_to :cart, optional: true
  belongs_to :order, optional: true

  validate :check_seller

  def check_seller
    unless self.cart.items.first.product.seller_id == self.product.seller_id
      errors.add(:base, 'Prodect can not be added for different seller!!!')
    end
  end
end
