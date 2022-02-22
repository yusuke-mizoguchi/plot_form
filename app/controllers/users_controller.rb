class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to login_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @use = User.new
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to login_path(user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
