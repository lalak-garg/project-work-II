class OrdersController < ApplicationController
	def show
		@order = Order.find(params[:id])
		@items = @order.items.all
	end

  def create
		customer = current_user.type_id
		seller_id = current_cart.items.first.product.seller_id
		@order = customer.orders.new(seller_id: seller_id, price: total_amount)        
		@order.save
		current_cart.items.update_all(cart_id: nil, order_id: @order.id)
		redirect_to @order
	end
end
