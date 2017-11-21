module SessionsHelper


  # @build  returns session id with user id
  # @params  hash from current user
  # @return  returns user id
  def log_in(user)
    session[:user_id] = user.id
  end

  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # @build  returns current user hash or nil
  # @params  none
  # @return  current user hash or nil
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # @build  checks that there is a user logged in, calls current_user
  # @params none
  # @return true or false
  def logged_in?
    !current_user.nil?
  end

  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # @build  logs out user, destroys session
  # @params none
  # @return none
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
