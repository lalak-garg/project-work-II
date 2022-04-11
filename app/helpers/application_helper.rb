module ApplicationHelper
    def current_cart
    cart_id = session[:cart_id]
    cart = Cart.find(cart_id) if cart_id
    if cart.blank?
        cart = current_user.type_id.carts.create(customer_id: current_user.id)
        session[:cart_id] = cart.id
    end
    cart
end
end
