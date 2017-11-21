class UsersController < ApplicationController
  include SessionsHelper

  # @build  creates collection of all users
  # @params  none
  # @return  users collection
  def index
      @users = User.all
  end

  # @build  shows current user, products, payment types, and number of products sold
  # @params
  # @return
  def show
    @user = User.find(current_user.id)
    @user_products = Product.where(seller_id: current_user.id)
    @payment_types = PaymentType.where(user_id: current_user.id)
    @number_sold = OrdersProduct.where(:product_id => @user_products.ids).group(:product_id).count
  end


  # @build  instatiats User object
  # @params  none
  # @return  @user
  def new
    @user = User.new
  end

  # @build  creates a new user
  # @params  inputfrom the user#new field
  # @return  redirects to root_url
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You're all signed up!"
      log_in(@user)
      redirect_to root_url
    else
      render 'new'
    end
  end

  # @build  edits user data
  # @params  input from user#edit form
  # @return  @user
  def edit
      @user = User.find(params[:id])
  end

  # @build  edits user data
  # @params  input from user#edit form
  # @return  @user
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to profile_path
    else
        render 'edit'
    end
  end

  private

    # @build  makes user fields editable by user
    # @params
    # @return  params
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
