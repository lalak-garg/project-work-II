class SellersController < ApplicationController
    def index
        @sellers = Seller.all
    end

    def show
        @seller = current_user.type_id
    end

    def new
        @seller = Seller.new
        @seller.build_user
    end

    def edit
        @seller = current_user.type_id
    end

    def create
        @seller = Seller.new(seller_params)
        respond_to do |format|
            if @seller.save
                format.html { redirect_to new_user_session_path, notice: 'Seller was successfully created.' }
                format.json { render :show, status: :created, location: @seller }
            else
                format.html { render :new }
                format.json { render json: @seller.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @seller.update(seller_params)
                format.html { redirect_to @seller, notice: 'Seller was successfully updated.' }
                format.json { render :show, status: :ok, location: @seller }
            else
                format.html { render :edit }
                format.json { render json: @seller.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @seller.destroy
        respond_to do |format|
            format.html { redirect_to sellers_url, notice: 'Seller was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        def seller_params
            params.require(:seller).permit(:name, :address, :status, user_attributes: [ :id, :email, :password, :password_confirmation ])
        end
end