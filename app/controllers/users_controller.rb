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
      flash[:notice] = "You have been signed up successfully!"
      redirect_to '/tasks'
    else
      render :new
    end
  end

  def update
    @user = User.new(user_params)

    if @user.save
      render 'tasks/index'
    else
      render :new
    end
  end

  def destroy

  end

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end
end