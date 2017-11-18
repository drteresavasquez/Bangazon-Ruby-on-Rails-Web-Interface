class UsersController < ApplicationController
    include SessionsHelper
        def index
            @users = User.all
        end

        def show
          @user = User.find(current_user.id)
          @user_products = Product.where(seller_id: current_user.id)
          @payment_types = PaymentType.where(user_id: current_user.id)
          @number_sold = OrdersProduct.where(:product_id => @user_products.ids).group(:product_id).count
        end
      
        def new
          @user = User.new
        end
      
        def create
          @user = User.new(user_params)
          if @user.save
            flash[:success] = "You're all signed up!"
            redirect_to '/'
          else
            render 'new'
          end
        end
      
        private
          def user_params
            params.require(:user).permit(
                :first_name,
                :last_name,
                :address,
                :city,
                :state,
                :zip,
                :phone,
                :email,
                :password,
                :confirm_password
              )
          end
end