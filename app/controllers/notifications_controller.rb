class NotificationsController < ApplicationController
  before_action :set_notification, only: [:destroy]

  def index

  end
  def destroy
    @notification.destroy
    flash[:notice] = "Notification was removed!"
    redirect_to notifications_path
  end

  private
  def set_notification
    @notification = Notification.find(params[:id])
  end
end