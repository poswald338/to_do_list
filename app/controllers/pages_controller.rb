class PagesController < ApplicationController
  def home
    if current_user
      redirect_to tasks_path
    end
  end

  # private
  # def reset_session
  #   session[:current_user_id] = nil
  # end
end