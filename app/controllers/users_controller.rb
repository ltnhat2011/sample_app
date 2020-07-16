class UsersController < ApplicationController
  def show
    @user = User.find_by id: params[:id]
    return if @user

    flash[:warning] = "User not found"
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params # Not the final implementation!
    if @user.save
      log_in @user
      flash[:success] = "welcome_to_the_sample_app!"
      redirect_to @user
      # Handle a successful save.
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit :name, :email,
                                 :password, :password_confirmation
  end
end
