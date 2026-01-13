class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user

  private

  def set_notifications
    notifications = current_user.notifications.order(created_at: :desc).limit(9)
    @unread = notifications.where(read_at: nil)
    @read = notifications.where.not(read_at: nil)
  end
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
end
