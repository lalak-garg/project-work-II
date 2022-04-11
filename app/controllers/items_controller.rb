class ItemsController < ApplicationController
    def create
			item = current_cart.items.new(item_params)
			item.save
			redirect_to home_path(item.product.seller_id)
    end

    private
			def item_params
				params.require(:item).permit(:quantity, :product_id)
			end
end