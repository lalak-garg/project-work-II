class ProductsController < ApplicationController
    before_action :load_seller
    def index
	    params[:category] = Category.first.name if params[:category].blank?
      @products = @seller.products.joins(:category).where("categories.name = ?", params[:category])
      @category = Category.all
      render "home/show"
    end

    def show
    end

    def new
		@category = Category.all
		@product = @seller.products.new
    end

    def edit
    end

    def create
		@category = Category.all
		@product = @seller.products.new(product_params)
		if @product.save
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
    end

    def update
    end

    def destroy
    end

    private
        def product_params
          params.require(:product).permit(:name, :category_id, :description, :price, :available)
        end

        def load_seller
          @seller = Seller.find(params[:seller_id])
        end
end