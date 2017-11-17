module SessionsHelper


  # @build  returns session id with user id
  # @params  hash from current user
  # @return  returns user id
  def log_in(user)
    session[:user_id] = user.id
  end

  # @build  returns current user hash or nil
  # @params  none
  # @return  current user hash or nil
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # @build  checks that there is a user logged in, calls current_user
  # @params none
  # @return true or false
  def logged_in?
    !current_user.nil?
  end

  # @build  logs out user, destroys session
  # @params none
  # @return none
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
