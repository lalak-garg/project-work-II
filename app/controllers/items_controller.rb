class ItemsController < ApplicationController
	def index
		@items = current_cart.items
	end
	
    def create
		item = current_cart.items.new(item_params)
		if item.save
		  redirect_to home_path(item.product.seller_id)
		else
			redirect_to home_path(item.product.seller_id), notice: item.errors.full_messages.join(",")
		end
    end

	def update
		item = current_cart.items.find(params[:id])
		item.update(item_params)
		redirect_to items_path
	end

	def destroy
		item = current_cart.items.find(params[:id])
		item.destroy
		redirect_to items_path
	end

    private
			def item_params
				params.require(:item).permit(:quantity, :product_id)
			end
end