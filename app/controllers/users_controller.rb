class UsersController < ApplicationController
  def show

  end

  def index

  end

  def new
    @user = User.new()
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render tasks_path
    else
      render :new
    end
  end

  def update

  end

  def destroy

  end

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end