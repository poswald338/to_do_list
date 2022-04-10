class SessionsController < ApplicationController
  
  def new
  
  end
  def create
    user = User.find_by(email: user_params[:email].downcase)
    if user && user.authenticate(user_params[:password])
      session[:current_user_id] = user.id
      flash[:notice] = "Successfully logged in!"
      redirect_to '/tasks'
    else
      flash[:alert] = "Something went wrong."
      redirect_to ''
    end
  end
  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "Successfully logged out"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email, :password)
  end
end