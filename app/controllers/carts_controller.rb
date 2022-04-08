class CartsController < ApplicationController
    def index
        @carts = current_payment.carts
    end

    def create
        @payment = current_payment
        @cart = @payment.carts.new(cart_params)
        @payment.save
        session[:payment_id] = @payment.id
    end

    def update
        @payment = current_payment
        @cart = @payment.carts.find(params[:id])
        @cart.update_attributes(cart_params)
        @carts = current_payment.carts
    end

    def destroy
        @payment = current_payment
        @cart = @payment.carts.find(params[:id])
        @cart.destroy
        @carts = current_payment.carts
    end

    private
        def cart_params
            params.require(:cart).permit(:product_id, :quantity)
        end
end
