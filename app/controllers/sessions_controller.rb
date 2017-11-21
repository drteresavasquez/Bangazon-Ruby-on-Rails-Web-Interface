class SessionsController < ApplicationController

  def new
  end

  # @build  creates a session using user login input
  # @params  user email and password
  # @return  redirects to home or flashes error
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # @build  destroys session of logged in user
  # @params  none
  # @return  redirects to home
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
