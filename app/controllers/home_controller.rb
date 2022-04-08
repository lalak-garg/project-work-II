class HomeController < ApplicationController
  def index
    @seller = Seller.all
    
  end

  def show
    @seller = Seller.find(params[:id])
    @category = Category.all
    @products = Product.joins(:category).where("categories.name = ?", @category.first.name)
  end
end
