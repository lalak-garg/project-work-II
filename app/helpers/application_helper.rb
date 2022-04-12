module ApplicationHelper
    def current_cart
        cart_id = session[:cart_id]
        cart = Cart.find(cart_id) if cart_id
        if cart.blank?
            cart = current_user.type_id.carts.find_or_create_by(customer_id: current_user.type_id_id)
            session[:cart_id] = cart.id
        end
        cart
    end

    def total_amount
        sum = 0
        current_cart.items.each do |item|
            sum += item.product.price*item.quantity
        end
        sum
    end
end
