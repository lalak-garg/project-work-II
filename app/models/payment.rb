class Payment < ApplicationRecord
    has_many :carts
    before_save :set_subtotal

    def subtotal
        carts.collect{|cart| cart.valid? ? cart.product.price*cart.quantity : 0}.sum
    end

    private
        def set_subtotal
            self[:subtotal] = subtotal
        end
end


