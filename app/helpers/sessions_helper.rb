module SessionsHelper
  # Logs in the given user.
  def log_in user
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    return unless session[:user_id]

    user = User.find_by id: session[:user_id]
    return if user

    flash.now[:danger] = "user incorrect"
    log_out
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    current_user.present?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
  end
end
