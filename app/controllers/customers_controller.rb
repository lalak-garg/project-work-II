class CustomersController < ApplicationController
    def index
        @customers = Customer.all
    end

    def show
        @customer = current_user.type_id
    end

    def new
        @customer = Customer.new
        @customer.build_user
    end

    def edit
        @customer = current_user.type_id
    end

    def create
        @customer = Customer.new(customer_params)
        respond_to do |format|
            if @customer.save
                format.html { redirect_to new_user_session_path, notice: 'Customer was successfully created.' }
                format.json { render :show, status: :created, location: @customer }
            else
                format.html { render :new }
                format.json { render json: @customer.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @customer.update(customer_params)
                format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
                format.json { render :show, status: :ok, location: @customer }
            else
                format.html { render :edit }
                format.json { render json: @customer.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @customer.destroy
        respond_to do |format|
            format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        def customer_params
            params.require(:customer).permit(:name, :contact_no, :address, user_attributes: [ :id, :email, :password, :password_confirmation ])
        end
end