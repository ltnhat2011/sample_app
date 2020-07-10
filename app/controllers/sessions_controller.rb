class SessionsController < ApplicationController
  before_action :check_users, only: %i(create)
  def new; end

  def create
    log_in @user
    params[:session][:remember_me] == "1" ? remember(@user) : forget(@user)
    redirect_back_or @user
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private
  def check_users
    @user = User.find_by email: params[:session][:email].downcase
    return if @user&.authenticate params[:session][:password]

    flash.now[:danger] = t("controller.sessions_controller.invalid")
    # Create an error message.
    render :new
  end
end
