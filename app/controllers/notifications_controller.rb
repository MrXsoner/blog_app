class NotificationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notification

  def mark_as_read
    @notification.update(read_at: Time.current)
    redirect_to @notification.event.url, notice: "Notification marked as read."
  end

  private

  def set_notification
    @notification = current_user.notifications.find(params[:id])
  end
end
