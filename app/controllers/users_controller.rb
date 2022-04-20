class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :require_same_user, only: [:show]

  def show
    @user = User.find(params[:id])
  end

  def index

  end

  def new
    @user = User.new()
  end

  def create
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
    @user = User.find(params[:id])

    if @user.save
      render 'tasks/index'
    else
      render :new
    end
  end

  def destroy
    @user.destroy
    session[:current_user_id] = nil
    flash[:notice] = "Account successfully deleted"
    redirect_to root_path
  end
  
  private

  def user_params 
    params.require(:user).permit(:username, :email, :password, :img_path)
  end

  def set_user 
    @user = User.find(params[:id])
  end

  def require_same_user
    user = User.find(params[:id])
    if user != current_user
      flash[:alert] = "You can only view tasks which you are a collaborator on."
      redirect_to user_path(current_user)
    end
  end
end