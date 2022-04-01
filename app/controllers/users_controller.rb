class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index

  end

  def new
    @user = User.new()
  end

  def create
    byebug
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      flash[:notice] = "You have been signed up successfully!"
      redirect_to '/tasks'
    else
      render :new
    end
  end

  def update
    @user = User.find([:id])

    if @user.save
      render 'tasks/index'
    else
      render :new
    end
  end

  def destroy

  end

  def user_params 
    params.require(:user).permit(:username, :email, :password, :img_path)
  end
end